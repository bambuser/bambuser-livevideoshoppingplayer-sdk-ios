//
//  PlayerViewController.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import BambuserLiveVideoShoppingPlayer
import UIKit
import WebKit

/**
 This screen is responsible for creating a player view, with
 support for both push, sheet and full modal navigation.
 
 The player listens for player events, using a shared player
 configuration that is provided by `DemoPlayerSettings`. The
 screen implements `DemoPlayerEventHandler` to handle events,
 like saving calendar events, sharing events etc.
 */
class PlayerViewController: UIViewController, DemoPlayerEventHandler {
    
    
    // MARK: - Initialization
    
    init(settings: DemoSettings, playerView: LiveVideoShoppingPlayerView? = nil) {
        self.playerView = playerView
        super.init(nibName: nil, bundle: nil)
        self.settings = settings
        view.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) { nil }
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if playerView == nil {
            playerView = createPlayerView()
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        
        setupViews()
        setupConstraints()
        
        closeButton.setImage(.close, for: .normal)
        shuffleButton.setImage(.next, for: .normal)
        pipButton.setImage(playerView.isPictureInPictureActive ? .pipExit : .pipEnter, for: .normal)
        shuffleButton.addTarget(self, action: #selector(onTappedShuffleButton), for: .touchUpInside)
        pipButton.addTarget(self, action: #selector(onTappedPipButton), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(onTappedCloseButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    // MARK: - Properties
    
    var playerView: LiveVideoShoppingPlayerView!
    
    private var settings = DemoSettings()
    
    private var stackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private var closeButton = UIButton()
    private let shuffleButton = UIButton()
    private let pipButton = UIButton()
    
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


// MARK: - Actions

@objc private extension PlayerViewController {
    
    func onTappedPipButton() {
        playerView.togglePictureInPicture()
    }
    
    func onTappedShuffleButton() {
        playerView.loadShow(settings.loadNextShow())
    }
    
    func onTappedCloseButton() {
        if navigationController == nil {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}


// MARK: - Internal Functionality

extension PlayerViewController {
    
    func dismiss() {}
    
    func saveCalendarEvent(in info: PlayerEventInfo) {
        guard let event = info.calendarEvent else { return print("No calendar event in event info.") }
        event.saveToCalendar {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure: UIAlertController.show(
                title: "Error",
                message: "Failed to save calendar event.",
                from: self)
            case .success: UIAlertController.show(
                title: "Success",
                message: "Event was added to calendar at \(event.startDate).",
                from: self)
            }
        }
    }
    
    func shareUrl(in info: PlayerEventInfo) {
        guard let url = info.url(for: .url) else { return print("No url in event info.") }
        print("Show share sheet for url: \(url)")
        let activitySheet = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        present(activitySheet, animated: true)
    }

    func openExternalUrl(_ url: URL?) {
        guard let url = url else {
            UIAlertController.show(
                title: "Error",
                message: "Invalid url while opening external link",
                from: self)

            return
        }

        UIApplication.shared.open(url)
    }
    
    func handleHighlightedProducts(in info: PlayerEventInfo) {
        let products = Product.getProducts(info)
        print(products)
    }

    func openProductDetails(_ data: PlayerEventInfo.Data) {
        guard
            let urlString = data["url"] as? String,
            let url = URL(string: urlString)
        else {
            return
        }

        let webView = WKWebView()
        let webController = UIViewController()
        webController.view = webView

        webView.load(URLRequest(url: url))

        self.navigationController?.pushViewController(webController, animated: true)
    }
}


// MARK: - Private Functionality

private extension PlayerViewController {
    
    func createPlayerView() -> LiveVideoShoppingPlayerView {
        let player = LiveVideoShoppingPlayerView(
            showId: settings.showId,
            configuration: settings.playerConfiguration { [weak self] info in
                switch info.event {
                case .addShowToCalendar: self?.saveCalendarEvent(in: info)
                case .playerDidClose: self?.dismiss()
                case .shareShow: self?.shareUrl(in: info)
                case .openExternalUrl: self?.openExternalUrl(info.url(for: .url))
                case .updateShowStatus: self?.handleHighlightedProducts(in: info)
                case .showProductView: self?.openProductDetails(info.data)
                default: print("Unhandled Event: \(info.event), data: \(info.data)")
                }
            })
        player.loadShow(settings.showId)
        return player
    }
}


// MARK: - Private View Setup

private extension PlayerViewController {
    
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
            playerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            playerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            playerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            playerView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 0),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
