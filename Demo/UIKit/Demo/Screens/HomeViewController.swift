//
//  HomeViewController.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import UIKit

/**
 This is the first main screen in the demo. It presents many
 menu alternatives and registers a PiP restore listener that
 is responsible for restoring PiP players that exit PiP when
 the source player screen has been deallocated.
 */
class HomeViewController: UITableViewController {
    
    
    // MARK: - Initialization
    
    init() {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) { nil }
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        staticCells = [
            [showPlayerCell, showPlayerAsSheetCell, fullScreenCoverCell],
            [themeNameCell, playerEngineCell],
            [upcomingShowCell],
            [pipEnabledCell, pipAutomaticCell],
            [cartViewCell, cartButtonCell, chatOverlayCell, productListCell, productViewCell, shareButtonCell, subscribeButtonCell]
        ]
        
        title = "Demo"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.contentInset = .zero
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.backgroundColor = .systemGray6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerPictureInPictureRestoreAction { [weak self] _ in
            print("Restoring parentless PiP player...")
            self?.showPlayerAsSheet()   // For now, we just present the player again
        }
    }
    
    
    // MARK: - Properties
    
    var settings = DemoSettings()
    var staticCells: [[UITableViewCell]] = []
    var headerTitles: [String] = ["Player", "Configuration", "Shows", "Picture-In-Picture", "UI Overlays"]
    
    
    // MARK: - Section 0
    
    private lazy var showPlayerCell = HomeNormalCell(
        item: HomeCellViewModel(
            title: "Show player",
            image: .player,
            value: nil,
            accessoryType: .disclosureIndicator,
            onValueChanged: nil))
    
    private lazy var showPlayerAsSheetCell = HomeNormalCell(
        item: HomeCellViewModel(
            title: "Show player as sheet",
            image: .sheet,
            value: nil,
            accessoryType: .disclosureIndicator,
            onValueChanged: nil))
    
    private lazy var fullScreenCoverCell = HomeNormalCell(
        item: HomeCellViewModel(
            title: "Show player as full screen cover",
            image: .cover,
            value: nil,
            accessoryType: .disclosureIndicator,
            onValueChanged: nil))

    //    // MARK: - Section 1

    private lazy var themeNameCell = HomeTextFieldCell(
        item: HomeCellViewModel(
            title: "Custom theme name",
            image: .link,
            value: settings.baseUrl) {
            self.settings.baseUrl = $0
        })

    private lazy var playerEngineCell = HomeTextFieldCell(
        item: HomeCellViewModel(
            title: "Player Engine",
            image: .theme,
            value: settings.themeName) {
            self.settings.themeName = $0
        })

//    // MARK: - Section 2

    private lazy var upcomingShowCell = HomeToggleCell(
        item: HomeCellViewModel(
            title: "Load upcoming show",
            image: .calendar,
            value: settings.loadUpcomingShow.wrappedValue) {
                self.settings.loadUpcomingShow.wrappedValue = $0
        })

    //    // MARK: - Section 3

    private lazy var pipEnabledCell = HomeToggleCell(
        item: HomeCellViewModel(
            title: "isEnabled",
            image: .pipEnter,
            value: settings.isPiPEnabled) {
                self.settings.isPiPEnabled = $0
            })

    private lazy var pipAutomaticCell = HomeToggleCell(
        item: HomeCellViewModel(
            title: "isAutomatic",
            image: .pipExit,
            value: settings.isPiPEnabled) {
                self.settings.isPiPAutomatic = $0
            })
    
    // MARK: - Section 4
    
    private lazy var cartViewCell = HomeToggleCell(
        item: HomeCellViewModel(
            title: "Show cart view",
            image: .cart,
            value: settings.cartView) {
            self.settings.cartView = $0
        })
    
    private lazy var cartButtonCell = HomeToggleCell(
        item: HomeCellViewModel(
            title: "Show cart button",
            image: .cart,
            value: settings.cartButton) {
            self.settings.cartButton = $0
        })
    
    private lazy var chatOverlayCell = HomeToggleCell(
        item: HomeCellViewModel(
            title: "Show chat overlay",
            image: .chat,
            value: settings.chatOverlay) {
            self.settings.chatOverlay = $0
        })
    
    private lazy var productListCell = HomeToggleCell(
        item: HomeCellViewModel(
            title: "Show product list",
            image: .product,
            value: settings.productList) {
            self.settings.productList = $0
        })
    
    private lazy var productViewCell = HomeToggleCell(
        item: HomeCellViewModel(
            title: "Show product view",
            image: .product,
            value: settings.productView) {
            self.settings.productView = $0
        })
    
    private lazy var shareButtonCell = HomeToggleCell(
        item: HomeCellViewModel(
            title: "Show share button",
            image: .share,
            value: settings.shareButton) {
            self.settings.shareButton = $0
        })
    
    private lazy var subscribeButtonCell = HomeToggleCell(
        item: HomeCellViewModel(
            title: "Show Subscribe Button",
            image: .subscribe,
            value: settings.subscribeButton) {
            self.settings.subscribeButton = $0
        })
    
    
    // MARK: - UITableViewControllerDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0: navigationController?.pushViewController(playerController, animated: true)
            case 1: showPlayerAsSheet()
            case 2: showPlayerAsFullscreenModal()
            default: break
            }
        }
    }
    
    
    // MARK: - UITableViewControllerDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        staticCells.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        staticCells[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        staticCells[indexPath.section][indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        headerTitles[section]
    }
}


// MARK: - Private Functionality

private extension HomeViewController {
    
    var playerController: PlayerViewController {
        PlayerViewController(settings: settings)
    }
    
    func showPlayer() {
        show(playerController, sender: nil)
    }
    
    func showPlayerAsSheet() {
        present(playerController, animated: true, completion: nil)
    }
    
    func showPlayerAsFullscreenModal() {
        let playerVC = playerController
        playerVC.modalPresentationStyle = .fullScreen
        present(playerVC, animated: true, completion: nil)
    }
}
