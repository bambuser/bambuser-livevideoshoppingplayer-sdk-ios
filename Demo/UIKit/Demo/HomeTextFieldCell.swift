//
//  HomeTextFieldCell.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import UIKit

class HomeTextFieldCell: UITableViewCell {
    
    init(item: HomeCellViewModel<String>) {
        self.item = item
        super.init(style: .default, reuseIdentifier: "")
        setupUI()
    }

    required init?(coder: NSCoder) { nil }
    
    
    var item: HomeCellViewModel<String>!
    
    private var iconImageView = UIImageView()
    private var textField = UITextField()
    
    
    private func setupUI() {
        [iconImageView, textField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            iconImageView.widthAnchor.constraint(equalToConstant: 25),
            iconImageView.heightAnchor.constraint(equalToConstant: 25),
            
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
        contentView.isHidden = true
        setup()
        textField.addTarget(self, action: #selector(onValueChanged), for: .editingChanged)
        
        selectionStyle = .none
        iconImageView.tintColor = .label
    }
    
    func setup() {
        textField.placeholder = item.title
        textField.text = item.value
        iconImageView.image = item.image
    }
}

@objc
private extension HomeTextFieldCell {
    func onValueChanged() {
        item.onValueChanged?(textField.text ?? "")
    }
}
