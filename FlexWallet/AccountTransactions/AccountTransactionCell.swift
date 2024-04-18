//
//  AccountTransactionCell.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 4/16/24.
//

import Foundation
import UIKit

class AccountTransactionCell: UITableViewCell {
    
    
    var amount: UILabel = {
        let amount = UILabel()
        amount.text = ""
        amount.textColor = .black
        return amount
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubviews([amount])
        amount.anchor(top: topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 20)
        setupCellStyle()
    }
    
    func setupCellStyle() {
        backgroundColor = .laurelGreen
        
    }
    
    func configure(with transaction: String) {
        amount.text = transaction
    }
}
