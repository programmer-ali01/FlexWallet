//
//  AddExpenseViewController.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 1/24/24.
//

import UIKit

final class AddTransactionViewController: UIViewController {
    
    private var customView: AddTransactionView = AddTransactionView()
    
    private var viewModel: AddTransactionViewModel
    
    init(viewModel: AddTransactionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view = customView
        setupUI()
        addActions()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func addActions() {
        customView.customHeader.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        customView.expenseSendButton.addTarget(self, action: #selector(sendExpenses), for: .touchUpInside)
        customView.expenseSendButton.addTarget(self, action: #selector(buttonTappedAnimation), for: .touchUpInside)
        
        customView.incomeSendButton.addTarget(self, action: #selector(sendIncome), for: .touchUpInside)
        customView.incomeSendButton.addTarget(self, action: #selector(buttonTappedAnimation), for: .touchUpInside)
    }
    
    func setupUI() {
        customView.setupUI()
    }

}

extension AddTransactionViewController {
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
   //     showTabBar(false)
    }
    
    @objc func sendExpenses() {
        let title = customView.expenseTitle.text ?? ""
        let amount = Double(customView.expenseAmount.text ?? "") ?? 0
        viewModel.sendExpenseData(title: title, amount: amount)
        print("DEBUG: triggerd send")
    }
    
    @objc func sendIncome() {
        let title = customView.incomeTitle.text ?? ""
        let amount = Double(customView.incomeAmount.text ?? "") ?? 0
        viewModel.sendIncomeData(title: title, amount: amount)
        print("DEBUG: triggered income send button")
    }
    
    @objc func buttonTappedAnimation(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
            }
        }
    }
}

extension AddTransactionViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateButtonState()
    }
    
    // Method to update button state based on text field contents
    func updateButtonState() {
        let text1 = customView.expenseTitle.text ?? ""
        let text2 = customView.expenseAmount.text ?? ""
        
        let text3 = customView.incomeTitle.text ?? ""
        let text4 = customView.incomeAmount.text ?? ""
        
        // Check if both text fields are empty
        if text1.isEmpty && text2.isEmpty {
            customView.expenseSendButton.backgroundColor = .gray
            customView.expenseSendButton.isUserInteractionEnabled = false
        } else {
            customView.expenseSendButton.backgroundColor = .orange
            customView.expenseSendButton.isUserInteractionEnabled = true
        }
        
        if text3.isEmpty && text4.isEmpty {
            customView.incomeSendButton.backgroundColor = .gray
            customView.incomeSendButton.isUserInteractionEnabled = false
        } else {
            customView.incomeSendButton.backgroundColor = .orange
            customView.incomeSendButton.isUserInteractionEnabled = true
        }
        
//        // Check if the second text field contains a valid number
//        let num = Double(text2)
//        if num != nil {
//            customView.sendButton.backgroundColor = .orange
//            customView.sendButton.isEnabled = true
//        } else {
//            customView.sendButton.backgroundColor = .gray
//            customView.sendButton.isEnabled = false
//        }
    }
}


//    func setupTabBar() {
//
//        view.backgroundColor = .systemBackground
//        navigationItem.title = "Expenses"
//    //    navigationController?.navigationBar.barStyle = .default
//        navigationController?.setNavigationBarHidden(false, animated: true)
//        navigationController?.navigationBar.backgroundColor = .orange
//        navigationController?.navigationBar.frame = CGRect(x: 0, y: 40, width: customView.screenSize.width, height: 400)
// //       navigationController?.navigationBar.
//       // navigationController?.navigationBar.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -20, height: 100)
//
//        let button = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
//        button.title = "Back"
//
//       // navigationItem.leftBarButtonItem = button
//    }
