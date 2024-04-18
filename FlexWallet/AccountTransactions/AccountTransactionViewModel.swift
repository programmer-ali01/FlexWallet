//
//  AccountTransactionViewModel.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 4/15/24.
//

import Foundation

final class AccountTransactionViewModel {
    
  //  var anyTransactions: [Any] = []
    
    var allTransactions: [AccountTransaction] = []
    
    var allUberEarnings: [UberEarnings] = []
    
    var allDeliverooEarnings: [DeliverooEarnings] = []
    
    let mockBankAccountDataURL = "https://programmer-ali01.github.io/data/mockBankAccount.json"
    
    let mockUberEarningsURL = "https://programmer-ali01.github.io/data/mockUberEarnings.json"
    
    let mockDeliverooEarningsURL = "https://programmer-ali01.github.io/data/mockDeliverooEarnings.json"
    
    var actualURL: String = ""
    
    var type: String = ""
    
    init(type: String) {
        self.type = type
    }
    
    func fetchAllBankAccountData() {
        AccountsManager.shared.fetchBankAccount(urlString: mockBankAccountDataURL) { result in
            switch result {
            case .success(let transactions):
                self.allTransactions = transactions.transactions
                print("DEBUG 1: \(self.allTransactions)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchAllUberEarnings() {
        AccountsManager.shared.fetchUberEarnings(urlString: mockUberEarningsURL) { result in
            switch result {
            case .success(let income_data):
                self.allUberEarnings = income_data.income_data
              //  print("DEBUG 1: \(self.allTransactions)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchAllDeliverooEarnings() {
        AccountsManager.shared.fetchDeliverooEarnings(urlString: mockDeliverooEarningsURL) { result in
            switch result {
            case .success(let earnings):
                self.allDeliverooEarnings = earnings.earnings
              //  print("DEBUG 1: \(self.allTransactions)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchCorrectData() {
        if type == "Bank account" {
            fetchAllBankAccountData()
        }
        if type == "Uber" {
            print("triggered")
            fetchAllUberEarnings()
        }
        if type == "Deliveroo" {
            fetchAllDeliverooEarnings()
        }
    }
    
}
