//
//  DeliverooEarnings.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 4/18/24.
//

import Foundation

struct DeliverooEarnings: Codable {
    let date: String
    let earnings: Double
    let jobCount: Int
}

struct allDeliverooEarnings: Codable {
    let earnings: [DeliverooEarnings]
}
