//
//  AddExpenseView.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import UIKit

final class AddTransactionView: UIView {
    
    let screenSize = UIScreen.main.bounds
    
    let customHeader = CustomHeader(title: "Expenses")
    
    let expenseTitle: UITextField = {
        let expenseTitle = UITextField()
        expenseTitle.placeholder = "Expense name"
        expenseTitle.isEnabled = true
        return expenseTitle
    }()
    
    let expenseAmount: UITextField = {
        let expenseAmount = UITextField()
        expenseAmount.placeholder = "Expense amount"
        expenseAmount.isEnabled = true
        return expenseAmount
    }()
    
    let expenseSendButton: UIButton = {
        let button = UIButton()
        button.setDimensions(height: 50, width: 100)
        button.backgroundColor = .gray
        button.setTitle("Send expenses", for: .normal)
        return button
    }()
    
    var lineView = UIView()
    
    let incomeTitle: UITextField = {
        let incomeTitle = UITextField()
        incomeTitle.placeholder = "Income name"
        incomeTitle.isEnabled = true
        return incomeTitle
    }()
    
    let incomeAmount: UITextField = {
        let incomeAmount = UITextField()
        incomeAmount.placeholder = "Income amount"
        incomeAmount.isEnabled = true
        return incomeAmount
    }()
    
    let incomeSendButton: UIButton = {
        let button = UIButton()
        button.setDimensions(height: 60, width: 100)
        button.backgroundColor = .gray
        button.setTitle("Send income", for: .normal)
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
        isUserInteractionEnabled = true
        backgroundColor = .white
        lineView = createLineView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1))
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubviews([customHeader, 
                     expenseTitle,
                     expenseAmount,
                     expenseSendButton,
                     lineView,
                     incomeTitle,
                     incomeAmount,
                     incomeSendButton])
        customHeader.anchor(top: topAnchor,
                            left: leftAnchor,
                            right: rightAnchor, 
                            paddingTop: 0,
                            height: 120)
        
        expenseTitle.anchor(top: customHeader.bottomAnchor, left: leftAnchor, paddingTop: 50, paddingLeft: 24)
        expenseAmount.anchor(top: expenseTitle.bottomAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 24)
        expenseSendButton.anchor(top: expenseAmount.bottomAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 24)
        
        lineView.anchor(top: expenseSendButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 24, paddingRight: 24)
        
        incomeTitle.anchor(top: lineView.bottomAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 24)
        incomeAmount.anchor(top: incomeTitle.bottomAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 24)
        incomeSendButton.anchor(top: incomeAmount.bottomAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 24)
    }
    
}
