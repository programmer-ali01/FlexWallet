//
//  Transaction.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 3/4/24.
//

import Foundation

////struct Expense {
////    let id: String
////    let title: String
////    let amount: Double
////    let date: Date
////    
////    // Initialize the expense
////    init(id: String, title: String, amount: Double, date: Date) {
////        self.id = id
////        self.title = title
////        self.amount = amount
////        self.date = date
////    }
////}
//
//struct Expense {
//    let id: String? = "" // Change id to optional
//    let title: String
//    let amount: Double
//    let date: Date
//    
//    // Initialize the expense
//    init(title: String, amount: Double, date: Date) {
//        self.title = title
//        self.amount = amount
//        self.date = date
//    }
//}

struct Transaction {
    let id: String? = ""
    let title: String
    let amount: Double
    let type: String
    let date: Date
    
    // Initialize the expense
    init(title: String, amount: Double, type: String, date: Date) {
        self.title = title
        self.amount = amount
        self.type = type
        self.date = date
    }
}
