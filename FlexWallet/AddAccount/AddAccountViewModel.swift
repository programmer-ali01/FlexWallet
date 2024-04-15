//
//  AddAccountViewModel.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import Foundation

final class AddAccountViewModel {
    
    func sendAccountDataToFireStore(title: String, platform: String, type: String) {
        let account = Account(title: title, platform: platform, type: type)
        DataManager.shared.sendAccountDataToFirestore(account: account)
    }
    
}
