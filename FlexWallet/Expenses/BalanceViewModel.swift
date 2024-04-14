//
//  ExpensesViewModel.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import Foundation

final class BalanceViewModel {
    
    var date = Date()
    
    init(date: Date) {
        self.date = date
    }
    
    func fetchExpenses(completion: @escaping ([Transaction]?, Error?) -> Void) {
        DataManager.shared.fetchExpensesFromFirestore { expenses, error in
            if let error = error {
                print("Could not fetch expenses")
                return
            }
            if let expenses = expenses {
                completion(expenses, nil)
            }
        }
    }
    
    func fetchIncome(completion: @escaping ([Transaction]?, Error?) -> Void) {
        DataManager.shared.fetchIncomeFromFireStore { incomes, error in
            if let error = error {
                print("Could not fetch income")
                return
            }
            if let incomes = incomes {
                completion(incomes, nil)
            }
        }
    }
    
}
