//
//  AddAccountView.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import UIKit

final class AddAccountView: UIView {
    
    let customHeader = CustomHeader(title: "Add an account", hideBackButton: false)
    
    var usernameTextField: UITextField = {
        let expenseAmount = UITextField()
        expenseAmount.placeholder = "enter username"
        expenseAmount.isEnabled = true
        return expenseAmount
    }()
    
    var passwordTextField: UITextField = {
        let expenseAmount = UITextField()
        expenseAmount.placeholder = "enter password"
        expenseAmount.isEnabled = true
        return expenseAmount
    }()
    
    var platformLabel = UILabel()

    var addAccountButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Confirm", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
       // super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        backgroundColor = .white
        addSubviews([customHeader, usernameTextField, passwordTextField, platformLabel, addAccountButton, confirmButton])
        addConstraints()
  
    }
    
    func addConstraints() {
        customHeader.anchor(top: topAnchor,
                            left: leftAnchor,
                            right: rightAnchor, paddingTop: 0, height: 120)
        addAccountButton.anchor(top: customHeader.bottomAnchor, right: rightAnchor, paddingTop: 20, paddingRight: 24)
        usernameTextField.anchor(top: addAccountButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 24, paddingRight: 24)
        passwordTextField.anchor(top: usernameTextField.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 24, paddingRight: 24)
        platformLabel.anchor(top: passwordTextField.bottomAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 24)
        confirmButton.anchor(top: platformLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 24, paddingRight: 24)
        
    }

}
