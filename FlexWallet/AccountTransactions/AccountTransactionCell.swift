//
//  AccountTransactionCell.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 4/16/24.
//

import Foundation
import UIKit

class AccountTransactionCell: UITableViewCell {
    
    
    var expenseAmount: UILabel = {
        let amount = UILabel()
        amount.text = "100"
        amount.textColor = .black
        return amount
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
    
    func setupUI() {
        addSubviews([expenseAmount])
        expenseAmount.anchor(top: topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 20)
    }
    
    func configure(with transaction: String) {
        expenseAmount.text = transaction
    }
}
