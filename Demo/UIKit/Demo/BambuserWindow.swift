//
//  BambuserWindow.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import BambuserLiveVideoShoppingPlayer
import UIKit

class BambuserWindow: UIWindow {
    
    init(windowScene: UIWindowScene, configuration: Configuration) {
        self.configuration = configuration
        super.init(windowScene: windowScene)
        addSubview(miniPlayerView)
    }
    
    required init?(coder: NSCoder) { nil }
    
    
    struct Configuration {
        let size: CGSize
        let isDraggable: Bool
    }
        
    private struct Constants {
        static let xPadding: CGFloat = 20
        static let yPadding: CGFloat = 50
    }
    
    enum ReappearStyle {
        case navigationController, sheet, fullScreen
    }
    
    
    private(set) var miniPlayerView = UIView(frame: .zero)
    private(set) var playerable: (UIViewController & Playerable)?
    private(set) var appearStyle: ReappearStyle?
    private lazy var gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(showPlayerViewController))
    private(set) var configuration: Configuration!

    var miniPlayerFrame: CGRect {
        CGRect(
            x: UIScreen.main.bounds.width - Constants.xPadding - configuration.size.width,
            y: UIScreen.main.bounds.height - Constants.yPadding - configuration.size.height,
            width: configuration.size.width,
            height: configuration.size.height
        )
    }
    
    
    static func removeMiniPlayer() {
        guard
            let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) as? BambuserWindow,
            let playerView = window.playerable?.playerView
        else { return }
        
        playerView.removeFromSuperview()
        window.playerable = nil
        window.appearStyle = nil
        window.miniPlayerView.frame = CGRect.zero
    }
    
    static func showMiniPlayer(with playerable: Playerable & UIViewController, style: ReappearStyle) {
        guard
            let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) as? BambuserWindow,
            let playerView = playerable.playerView
        else { return }
        
        playerView.callFunction(.hideUI) { _ in }
        
        window.playerable = playerable
        window.appearStyle = style
        
        window.miniPlayerView.isHidden = false
        window.bringSubviewToFront(window.miniPlayerView)
        window.miniPlayerView.addSubview(playerView)
        
        window.miniPlayerView.removeGestureRecognizer(window.tapGesture)
        
        window.tapGesture.delegate = window
        window.miniPlayerView.addGestureRecognizer(window.tapGesture)
        
        if window.configuration.isDraggable {
            window.miniPlayerView.removeGestureRecognizer(window.gestureRecognizer)
            window.gestureRecognizer.delegate = window
            window.miniPlayerView.addGestureRecognizer(window.gestureRecognizer)
        }
        
        NSLayoutConstraint.activate([
            playerView.leadingAnchor.constraint(equalTo: window.miniPlayerView.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: window.miniPlayerView.trailingAnchor),
            playerView.topAnchor.constraint(equalTo: window.miniPlayerView.topAnchor),
            playerView.bottomAnchor.constraint(equalTo: window.miniPlayerView.bottomAnchor)
        ])
        
        UIView.animate(withDuration: 0.3) {
            window.miniPlayerView.frame = window.miniPlayerFrame
        } completion: { _ in
            window.layoutIfNeeded()
        }
    }
}

@objc
private extension BambuserWindow {
    
    func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard
            let viewToDrag = gestureRecognizer.view,
            (gestureRecognizer.state == .began || gestureRecognizer.state == .changed)
        else { return }
        
        let translation = gestureRecognizer.translation(in: miniPlayerView)
        viewToDrag.center = CGPoint(
            x: viewToDrag.center.x + translation.x,
            y: viewToDrag.center.y + translation.y)
        gestureRecognizer.setTranslation(CGPoint(x: 0, y: 0), in: viewToDrag)
    }
    
    func showPlayerViewController() {
        guard
            let playerable = playerable,
            let option = appearStyle
        else { return }
        
        playerable.showFullScreen(playerView: playerable.playerView)
        playerable.playerView.callFunction(.showUI) { _ in }
        
        switch option {
        case .navigationController:
            guard let root = rootViewController as? UINavigationController else { return }
            root.pushViewController(playerable, animated: false)

        case .sheet:
            rootViewController?.present(playerable, animated: true, completion: nil)

        case .fullScreen:
            playerable.modalPresentationStyle = .fullScreen
            rootViewController?.present(playerable, animated: true, completion: nil)
    
        }
        
        miniPlayerView.isHidden = true
        self.playerable = nil
    }
}

extension BambuserWindow: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
