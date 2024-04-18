//
//  AccountTransactions.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 4/17/24.
//

import Foundation

struct AccountTransaction: Codable {
    let id: String
    let date: String
    let description: String
    let amount: Double
    let category: String
    let type: String // 'debit' or 'credit'
}

struct AllAccountTransaction: Codable {
    let transactions: [AccountTransaction]
}
