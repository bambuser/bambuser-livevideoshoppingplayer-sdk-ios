//
//  PlayerViewController.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import BambuserLiveVideoShoppingPlayer
import UIKit

class PlayerViewController: UIViewController, Playerable {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    

    private var demoContext = DemoContext()
    
    var playerView: LiveVideoShoppingPlayerView!
    
    private var stackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private var closeButton = UIButton()
    private let shuffleButton = UIButton()
    private let pipButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BambuserWindow.removeMiniPlayer()
        
        if playerView == nil {
            playerView = LiveVideoShoppingPlayerView(
                showId: demoContext.showId,
                configuration: demoContext.playerConfiguration())
            playerView.loadShow(demoContext.showId)
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        
        setupViews()
        setupConstraints()
        
        closeButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        shuffleButton.setImage(UIImage(systemName: "shuffle.circle"), for: .normal)
        pipButton.setImage(UIImage(systemName: "pip.enter"), for: .normal)
        shuffleButton.addTarget(self, action: #selector(onTappedShuffleButton), for: .touchUpInside)
        pipButton.addTarget(self, action: #selector(onTappedPipButton), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(onTappedCloseButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func showFullScreen(playerView: LiveVideoShoppingPlayerView) {
        playerView.removeConstraints(playerView.constraints)
        view.addSubview(playerView)
        
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20),
            playerView.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20),
            playerView.rightAnchor.constraint(
                equalTo: view.rightAnchor,
                constant: -20),
            playerView.bottomAnchor.constraint(
                equalTo: stackView.topAnchor,
                constant: -20)
        ])
    }
}

@objc private extension PlayerViewController {
    
    func onTappedPipButton() {
        if navigationController == nil {
            let style = modalPresentationStyle == .fullScreen ? BambuserWindow.ReappearStyle.fullScreen : .sheet
            BambuserWindow.showMiniPlayer(with: self, style: style)
            dismiss(animated: false, completion: nil)
        } else {
            BambuserWindow.showMiniPlayer(with: self, style: .navigationController)
            navigationController?.popViewController(animated: false)
        }
    }

    func onTappedShuffleButton() {
        playerView.loadShow(demoContext.loadNextShow())
    }
    
    func onTappedCloseButton() {
        if navigationController == nil {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}

extension PlayerViewController {
    
    func setupViews() {
        stackView.addArrangedSubview(closeButton)
        stackView.addArrangedSubview(shuffleButton)
        stackView.addArrangedSubview(pipButton)
        
        view.addSubview(playerView)
        view.addSubview(stackView)
    }
    
    func setupConstraints() {
        playerView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20),
            playerView.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20),
            playerView.rightAnchor.constraint(
                equalTo: view.rightAnchor,
                constant: -20),
            playerView.bottomAnchor.constraint(
                equalTo: stackView.topAnchor,
                constant: -20),
            
            stackView.heightAnchor.constraint(
                equalToConstant: 50),
            stackView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -20),
            stackView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)
        ])
    }
}
