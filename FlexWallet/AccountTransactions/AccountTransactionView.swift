//
//  AccountTransactionView.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 4/15/24.
//

import Foundation
import UIKit

final class AccountTransactionView: UIView {
    
    let customHeader = CustomHeader(title: "All transactions", hideBackButton: false)
    
    var tableView = UITableView(frame: .zero, style: .plain)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
       // super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubviews([customHeader, tableView])
    }
    
    func setupUI() {
        backgroundColor = .white
        addSubviews()
        addConstraints()
    }
    
    func addConstraints() {
        customHeader.anchor(top: topAnchor,
                            left: leftAnchor,
                            right: rightAnchor, paddingTop: 0, height: 120)
        tableView.anchor(top: customHeader.bottomAnchor,
                         left: leftAnchor,
                         right: rightAnchor,
                         paddingTop: 50,
//                         paddingLeft: 24,
//                         paddingRight: 24,
                         height: 1200)
        tableView.layer.cornerRadius = 4
        tableView.isScrollEnabled = true
        tableView.layer.masksToBounds = true
        tableView.backgroundColor = .laurelGreen
    }
}
