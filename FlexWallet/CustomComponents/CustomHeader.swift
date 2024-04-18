//
//  CustomHeader.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 3/3/24.
//

import UIKit
import SwiftUI

class CustomHeader: UIView {
    
    let stackView = UIStackView()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    var backButton: UIButton = {
        let button = UIButton(type: .system)
       // button.isUserInteractionEnabled = true
        return button
    }()
    
    init(frame: CGRect = .zero, title: String, hideBackButton: Bool = false) {
      
        super.init(frame: frame)
        titleLabel.text = title
        
        if hideBackButton {
            backButton.isHidden = true
        }
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func setupUI() {
        isUserInteractionEnabled = true
        addSubview(stackView)
        backgroundColor = .systemIndigo
        setupStackView()
        adjustButtons()
        setupConstraints()
    }
    
    func setupStackView() {
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(titleLabel)
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func adjustButtons() {
        backButton.isUserInteractionEnabled = true
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
    }
    
    func setupConstraints() {
        backButton.anchor(top: stackView.topAnchor, left: stackView.leftAnchor)
        titleLabel.anchor(top: stackView.topAnchor, left: backButton.rightAnchor, paddingLeft: 10)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 70, paddingLeft: 20, height: 20)
    }
    
}
