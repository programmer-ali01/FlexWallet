//
//  ExpensesView.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import UIKit

final class BalanceView: UIView {
    
    let screenSize = UIScreen.main.bounds
    
    let customHeader = CustomHeader(title: "Balance")
    
    var tableView = UITableView(frame: .zero, style: .plain)
//    var tableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .plain)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.backgroundColor = .systemCyan
//        tableView.bounces = true
//        tableView.register(TransactionCell.self, forCellReuseIdentifier: "transactionCell")
//        tableView.showsVerticalScrollIndicator = false
//        return tableView
//    }()
    
    
    let addTransactionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
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
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubviews([customHeader, addTransactionButton, tableView])
        customHeader.anchor(top: topAnchor,
                            left: leftAnchor,
                            right: rightAnchor, paddingTop: 0, height: 120)
        addTransactionButton.anchor(top: customHeader.bottomAnchor,
                                    right: rightAnchor,
                                    paddingTop: 20,
                                    paddingRight: 24)
        tableView.anchor(top: addTransactionButton.bottomAnchor,
                         left: leftAnchor,
                         right: rightAnchor,
                         paddingTop: 40, height: 1000)
        
    }
}
