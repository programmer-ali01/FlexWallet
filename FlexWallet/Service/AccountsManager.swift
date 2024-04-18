//
//  AccountsManager.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 4/17/24.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
}

class AccountsManager {
    
    static let shared = AccountsManager()
    
    func fetchBankAccount(urlString: String, completion: @escaping (Result<AllAccountTransaction, NetworkError>) -> Void) {
        let url = URL(string: urlString) ?? URL(fileURLWithPath: "")
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data, error == nil else {
                       // completion(.failure(.error))
                        return
                    }
                    do {
                        let transactions = try JSONDecoder().decode(AllAccountTransaction.self, from: data)
                        completion(.success(transactions))
                    } catch {
                        completion(.failure(.decodingError))
                    }
                }
                
            }.resume()
            
        }
    
    func fetchUberEarnings(urlString: String, completion: @escaping (Result<AllUberEarnings, NetworkError>) -> Void) {
        let url = URL(string: urlString) ?? URL(fileURLWithPath: "")
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                   // completion(.failure(.error))
                    return
                }
                do {
                    let income_data = try JSONDecoder().decode(AllUberEarnings.self, from: data)
                    completion(.success(income_data))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
            
        }.resume()
    }
    
    func fetchDeliverooEarnings(urlString: String, completion: @escaping (Result<allDeliverooEarnings, NetworkError>) -> Void) {
        let url = URL(string: urlString) ?? URL(fileURLWithPath: "")
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                   // completion(.failure(.error))
                    return
                }
                do {
                    let earnings = try JSONDecoder().decode(allDeliverooEarnings.self, from: data)
                    completion(.success(earnings))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
            
        }.resume()
    }
    
}
