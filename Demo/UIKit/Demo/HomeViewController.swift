//
//  HomeViewController.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import UIKit

class HomeViewController: UITableViewController {
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        staticCells = [[showPlayerCell, showPlayerAsSheetCell, fullScreenCoverCell], [themeNameCell, showCartViewCell, showCartButton, showChatOverlay, productListCell, productViewCell, shareButtonCell, menuButtonCell, subscribeButtonCell]]
        
        view.backgroundColor = .white
        title = "Live Shopping Player"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.contentInset = .zero
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.backgroundColor = .systemGray6
    }
    
    
    // MARK: - Properties
    
    var demoContext = DemoContext()
    var staticCells: [[UITableViewCell]] = []
    
    
    // MARK: - Section 0
    
    private lazy var showPlayerCell = HomeNormalCell(item: HomeCellViewModel(title: "Show player", image: .player, value: nil, onValueChanged: nil))
    
    private lazy var showPlayerAsSheetCell = HomeNormalCell(item: HomeCellViewModel(title: "Show player as sheet", image: .sheet, value: nil, onValueChanged: nil))
    
    private lazy var fullScreenCoverCell = HomeNormalCell(item: HomeCellViewModel(title: "Show player as full screen cover", image: .cover, value: nil, onValueChanged: nil))
    
    
    // MARK: - Section 1
    
    private lazy var themeNameCell = HomeTextFieldCell(item: HomeCellViewModel(title: "Custom theme name", image: .theme, value: demoContext.themeName, onValueChanged: { value in
        self.demoContext.themeName = value
    }))
    
    private lazy var showCartViewCell = HomeToggleCell(item: HomeCellViewModel(title: "Show cart view", image: .cart, value: demoContext.cartView, onValueChanged: { value in
        self.demoContext.cartView = value
    }))
    
    private lazy var showCartButton = HomeToggleCell(item: HomeCellViewModel(title: "Show cart button", image: .cart, value: demoContext.cartButton, onValueChanged: { value in
        self.demoContext.cartButton = value
    }))
    
    private lazy var showChatOverlay = HomeToggleCell(item: HomeCellViewModel(title: "Show chat overlay", image: .chat, value: demoContext.chatOverlay, onValueChanged: { value in
        self.demoContext.chatOverlay = value
    }))
    
    private lazy var productListCell = HomeToggleCell(item: HomeCellViewModel(title: "Show product list", image: .product, value: demoContext.productList, onValueChanged: { value in
        self.demoContext.productList = value
    }))
    
    private lazy var productViewCell = HomeToggleCell(item: HomeCellViewModel(title: "Show product view", image: .product, value: demoContext.cartView, onValueChanged: { value in
        self.demoContext.productView = value
    }))
    
    private lazy var shareButtonCell = HomeToggleCell(item: HomeCellViewModel(title: "Show share button", image: .share, value: demoContext.shareButton, onValueChanged: { value in
        self.demoContext.shareButton = value
    }))
    
    private lazy var menuButtonCell = HomeToggleCell(item: HomeCellViewModel(title: "Show Share MenuButton", image: .share, value: demoContext.shareMenuButton, onValueChanged: { value in
        self.demoContext.shareMenuButton = value
    }))
    
    private lazy var subscribeButtonCell = HomeToggleCell(item: HomeCellViewModel(title: "Show Subscribe Button", image: .subscribe, value: demoContext.subscribeButton, onValueChanged: { value in
        self.demoContext.subscribeButton = value
    }))
    
    
    // MARK: - UITableViewControllerDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                navigationController?.pushViewController(PlayerViewController(), animated: true)
            case 1:
                present(PlayerViewController(), animated: true, completion: nil)
            case 2:
                let playerVC = PlayerViewController()
                playerVC.modalPresentationStyle = .fullScreen
                present(playerVC, animated: true, completion: nil)
            default:
                break
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
        "Player"
    }
}
