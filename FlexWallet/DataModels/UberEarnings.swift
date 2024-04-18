//
//  UberEarnings.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 4/18/24.
//

import Foundation

struct UberEarnings: Codable {
    let date: String
    let earnings: Double
    let trip_count: Int
}

struct AllUberEarnings: Codable {
    let income_data: [UberEarnings]
}
