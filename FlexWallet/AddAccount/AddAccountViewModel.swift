//
//  AddAccountViewModel.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import Foundation

final class AddAccountViewModel {
    
    func sendAccountDataToFireStore() {
        let account = Account(title: "John's current account", platform: "Bank A", type: "Bank account")
        DataManager.shared.sendAccountDataToFirestore(account: account)
    }
    
}
