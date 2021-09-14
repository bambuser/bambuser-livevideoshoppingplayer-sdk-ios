//
//  HomeNormalCell.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import UIKit

class HomeNormalCell: UITableViewCell {
    
    init(item: HomeCellViewModel<Int>?) {
        self.item = item
        super.init(style: .default, reuseIdentifier: "")
        
        setupUI()
    }
    
    required init?(coder: NSCoder) { nil }
    
    
    var item: HomeCellViewModel<Int>?
    
    private var iconImageView = UIImageView()
    private var titleLabel = UILabel()
    
    
    private func setupUI() {
        [iconImageView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            iconImageView.widthAnchor.constraint(equalToConstant: 25),
            iconImageView.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
        
        setup()
        selectionStyle = .none
        iconImageView.tintColor = .label
    }
    
    func setup() {
        titleLabel.text = item?.title ?? ""
        iconImageView.image = item?.image
    }
}
