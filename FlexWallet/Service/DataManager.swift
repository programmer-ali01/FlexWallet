//
//  DataManager.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 3/4/24.
//

import Foundation
import FirebaseFirestore

class DataManager {
    static let shared = DataManager()
    
    func sendExpenseToFirestore(expense: Transaction) {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil // Reference to the newly added document
        ref = db.collection("expenses").addDocument(data: [
            "title": expense.title,
            "amount": expense.amount,
            "type": expense.type,
            "date": expense.date
        ]) { error in
            if let error = error {
                print("Error adding expense document: \(error)")
            } else {
                if let documentID = ref?.documentID {
                    print("Expense document added with ID: \(documentID)")
                }
            }
        }
    }
    
    func sendIncomeToFireStore(income: Transaction) {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("income").addDocument(data: [
            "title": income.title,
            "amount": income.amount,
            "type": income.type,
            "date": income.date
        ]) { error in
            if let error = error {
                print("Error adding income document: \(error)")
            } else {
                if let documentID = ref?.documentID {
                    print("Income document added with ID: \(documentID)")
                }
            }
        }
    }
    
    func fetchExpensesFromFirestore(completion: @escaping ([Transaction]?, Error?) -> Void) {
        let collectionRef = Firestore.firestore().collection("expenses")  // This line
           collectionRef.getDocuments { (snapshot, error) in
               if let err = error {
                   print("error fetching docs: \(err)")
               } else {
                   guard let snap = snapshot else {
                       return
                   }
                   var expenses = [Transaction]()
                   for document in snap.documents {
                       let data = document.data()
                       let title = data["title"] as? String
                       let amount = data["amount"] as? Double
                       let type = data["type"] as? String
                       let date = data["date"] as? Timestamp
                       let expense = Transaction(title: title ?? "", amount: amount ?? 0, type: type ?? "", date: date?.dateValue() ?? Date())
                       expenses.append(expense)
                       print(document.data())
                   }
                   completion(expenses, nil)
               }
           }
    }
    
    func fetchIncomeFromFireStore(completion: @escaping ([Transaction]?, Error?) -> Void) {
        let collectionRef = Firestore.firestore().collection("income")
            collectionRef.getDocuments { (snapshot, error) in
                if let err = error {
                    print("error fetching income: \(err)")
                } else {
                    guard let snap = snapshot else {
                        return
                    }
                    var incomes = [Transaction]()
                    for document in snap.documents {
                        let data = document.data()
                        let title = data["title"] as? String
                        let amount = data["amount"] as? Double
                        let type = data["type"] as? String
                        let date = data["date"] as? Timestamp
                        let income = Transaction(title: title ?? "", amount: amount ?? 0, type: type ?? "", date: date?.dateValue() ?? Date())
                        incomes.append(income)
                        print(document.data())
                    }
                    completion(incomes, nil)
                }
            }
    }
    
    func sendAccountDataToFirestore(account: Account) {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil // Reference to the newly added document
        ref = db.collection("accounts").addDocument(data: [
            "title": account.title,
            "platform": account.platform,
            "type": account.type
        ]) { error in
            if let error = error {
                print("Error adding account document: \(error)")
            } else {
                if let documentID = ref?.documentID {
                    print("Account document added with ID: \(documentID)")
                }
            }
        }
    }
    
    func fetchAccounsFromFireStore(completion: @escaping ([Account]?, Error?) -> Void) {
        let collectionRef = Firestore.firestore().collection("accounts")
        collectionRef.getDocuments { (snapshot, error) in
            if let err = error {
                print("error fetching accounts: \(err)")
            } else {
                guard let snap = snapshot else {
                    return
                }
                var accounts = [Account]()
                for document in snap.documents {
                    let data = document.data()
                    let title = data["title"] as? String
                    let platform = data["platform"] as? String
                    let type = data["type"] as? String
                    let account = Account(title: title ?? "", platform: platform ?? "", type: type ?? "")
                    accounts.append(account)
                }
                completion(accounts, nil)
            }
        }
    }
}


// old code

//    func sendExpenseToFirestore(expense: Expense) {
//         let db = Firestore.firestore()
//         db.collection("expenses").document(expense.id).setData([
//             "title": expense.title,
//             "amount": expense.amount,
//             "date": expense.date
//         ]) { error in
//             if let error = error {
//                 print("Error adding document: \(error)")
//             } else {
//                 print("Document added with ID: \(expense.id)")
//             }
//         }
//     }
//        let db = Firestore.firestore()
//        db.collection("expenses").getDocuments { querySnapshot, error in
//            if let error = error {
//                completion(nil, error)
//            } else {
//                var expenses = [Expense]()
//                for document in querySnapshot!.documents {
//                    if let title = document.data()["title"] as? String,
//                       let amount = document.data()["amount"] as? Double,
//                       let dateTimestamp = document.data()["date"] as? Timestamp {
//                        let expense = Expense(title: title, amount: amount, date: dateTimestamp.dateValue())
//                        print("DEBUG: \(expenses)")
//                        expenses.append(expense)
//                    }
//                }
//                completion(expenses, nil)
//            }
//        }
