//
//  AddExpenseViewModel.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import Foundation

final class AddTransactionViewModel {
    var date = Date()
    
    init(date: Date) {
        self.date = date
    }
    
    func sendExpenseData(title: String, amount: Double) {
        //   let expenseModel = Expense(title: title, amount: amount, date: date)
        let expenseModel = Transaction(title: title, amount: amount, type: "Expense", date: date)
        DataManager.shared.sendExpenseToFirestore(expense: expenseModel)
    }
    
    func sendIncomeData(title: String, amount: Double) {
        //let incomeModel = Income(title: title, amount: amount, date: date)
        let incomeModel = Transaction(title: title, amount: amount, type: "Income", date: date)
        DataManager.shared.sendIncomeToFireStore(income: incomeModel)
    }
}
