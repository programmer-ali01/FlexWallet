//
//  TransactionCell.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 3/28/24.
//

import UIKit

class TransactionCell: UITableViewCell {
    var expenseTitle: UILabel = {
        let expense = UILabel()
        expense.text = "Food"
        expense.textColor = .black
        return expense
    }()
    
    var expenseAmount: UILabel = {
        let amount = UILabel()
        amount.text = "100"
        amount.textColor = .black
        return amount
    }()
    
    var transactionType: UILabel = {
        let type = UILabel()
        type.text = ""
        type.textColor = .black
        return type
    }()
    
    var incomeTitle: UILabel = {
        let income = UILabel()
        income.textColor = .black
        return income
    }()
    
    var incomeAmount: UILabel = {
        let amount = UILabel()
        amount.textColor = .black
        return amount
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        contentView.addSubview(expenseTitle)
//        contentView.addSubview(expenseAmount)
        setupUI()
 
    }
    
    required init?(coder: NSCoder) {
      //  super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
      //  setupUI()
    }
    
    func setupUI() {
        addSubview(expenseTitle)
        addSubview(expenseAmount)
        addSubview(transactionType)
        
        expenseTitle.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 10)
        expenseAmount.anchor(top: expenseTitle.bottomAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 10)
        transactionType.anchor(top: expenseAmount.bottomAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 10)
    }
    
    func configure(
      //  transactionType: String,
     //   expense: Expense? = nil, income: Income? = nil
        with transaction: Transaction
    ) {
            print("DEBUG triggered")
            transactionType.text = transaction.type
            expenseTitle.text = transaction.title
            expenseAmount.text = "$\(transaction.amount)"
            
            print("DEBUG title: \(expenseTitle.text)")
            print("DEBUG amount: \(expenseAmount.text)")
    }
}
