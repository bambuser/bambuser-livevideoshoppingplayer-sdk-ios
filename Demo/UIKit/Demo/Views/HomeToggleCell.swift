//
//  HomeToggleCell.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import UIKit

class HomeToggleCell: UITableViewCell {
    
    init(item: HomeCellViewModel<Bool>) {
        self.item = item
        super.init(style: .default, reuseIdentifier: "")
        setupUI()
    }

    required init?(coder: NSCoder) { nil }
    
    
    var item: HomeCellViewModel<Bool>!
    
    private var iconImageView = UIImageView()
    private var titleLabel = UILabel()
    private var toggle = UISwitch()
    
    
    private func setupUI() {
        [iconImageView, titleLabel, toggle].forEach {
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
            titleLabel.rightAnchor.constraint(equalTo: toggle.leftAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            toggle.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            toggle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        contentView.isHidden = true
        
        toggle.addTarget(self, action: #selector(onToggleChanged), for: .valueChanged)
        setup()
        selectionStyle = .none
        iconImageView.tintColor = .label
        backgroundColor = .systemBackground
    }
    
    func setup() {
        titleLabel.text = item.title
        if let value = item.value {
            toggle.isOn = value
        }
        iconImageView.image = item.image
    }
}

@objc
private extension HomeToggleCell {
    func onToggleChanged() {
        item.onValueChanged?(self.toggle.isOn)
    }
}
