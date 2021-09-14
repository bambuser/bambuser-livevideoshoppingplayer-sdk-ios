//
//  PlayerViewController.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import BambuserLiveVideoShoppingPlayer
import UIKit

class PlayerViewController: UIViewController {
    
    
    // MARK: - Initialization
    
    init(settings: DemoSettings) {
        super.init(nibName: nil, bundle: nil)
        self.settings = settings
    }
    
    required init?(coder: NSCoder) { nil }

    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if playerView == nil {
            playerView = LiveVideoShoppingPlayerView(
                showId: settings.showId,
                configuration: settings.playerConfiguration {
                    print("Event: \($0)")
                })
            playerView.loadShow(settings.showId)
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
