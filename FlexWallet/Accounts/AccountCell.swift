//
//  AccountsCell.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 4/7/24.
//

import UIKit

final class AccountCell: UITableViewCell {
    
    let accountTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 12)
        return label
    }()
    
    let accountPlatform: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 12)
        return label
    }()
    
    let accountType: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
 
    }
    
    required init?(coder: NSCoder) {
      //  super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
      //  setupUI()
    }
    
    func addSubviews() {
        addSubviews([accountTitle,
                     accountPlatform,
                     accountType])
    }
    
    func addConstraints() {
        accountTitle.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 32)
        accountPlatform.anchor(top: accountTitle.bottomAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 32)
        accountType.anchor(top: topAnchor, right: rightAnchor, paddingTop: 10, paddingRight: 32)
        
    }
    
    func setupUI() {
        addSubviews()
        addConstraints()
    }
    
    func configureCell(with account: Account) {
        accountTitle.text = account.title
        accountPlatform.text = account.platform
        accountType.text = account.type
    }
}
