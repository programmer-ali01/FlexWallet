//
//  AccountsViewModel.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import Foundation

final class AccountsViewModel {
    var accountsCellData: [Account] = [
//        Account(title: "John's current account", platform: "Barclays", type: "Bank account"),
//        Account(title: "Sarah's upwork account", platform: "Upwork", type: "gig platform"),
//        Account(title: "Kevin's deliveroo account", platform: "Deliveroo", type: "gig platform"),
    ]
    
    func fetchAccountsData(completion: @escaping ([Account]?, Error?) -> Void) {
        DataManager.shared.fetchAccounsFromFireStore { accounts, error in
            if let error = error {
                print("Could not fetch income")
                return
            }
            if let accounts = accounts {
                completion(accounts, nil)
            }
        }
    }
    
    
    
}
