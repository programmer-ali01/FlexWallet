//
//  ExpensesViewController.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import UIKit

final class BalanceViewController: UIViewController {
    
    private var customView: BalanceView = BalanceView()
    
    private var viewModel: BalanceViewModel
    
    var allTransactions: [Transaction] = []
    
    init(viewModel: BalanceViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view = customView

        fetchAllTransactions()
        addActions()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchAllExpenses() {
        viewModel.fetchExpenses { expenses, error in
            if let error = error {
                print("Error fetching \(error)")
                return
            }
            if let expenses = expenses {
                self.allTransactions.append(contentsOf: expenses)
                print("DEBUG all expenses: \(self.allTransactions)")
                DispatchQueue.main.async {
                    self.customView.tableView.reloadData()
                }
            }
        }
    }

    func fetchAllIncome() {
        viewModel.fetchIncome { income, error in
            if let error = error {
                print("Error fetching \(error)")
                return
            }
            if let income = income {
                self.allTransactions.append(contentsOf: income)
              //  self.allTransactions = income
                print("DEBUG all income: \(self.allTransactions)")
                DispatchQueue.main.async {
                    self.customView.tableView.reloadData()
                }
            }
        }
    }
    
    func fetchAllTransactions() {
        fetchAllExpenses()
        fetchAllIncome()
        
//    //    allTransactions = expenses.map { $0 as Any } + income.map { $0 as Any }
//        DispatchQueue.main.async {
//            self.customView.tableView.reloadData()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func setupTableView() {
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
        customView.tableView.register(TransactionCell.self, forCellReuseIdentifier: "transactionCell")
    }
    
    func addActions() {
        customView.customHeader.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        customView.addTransactionButton.addTarget(self, action: #selector(goToAddTransaction), for: .touchUpInside)
    }
    
    func setupUI() {
        customView.setupUI()
    }
    
    @objc func goToAddTransaction() {
        let vm = AddTransactionViewModel(date: viewModel.date)
        let addTransactionVC = AddTransactionViewController(viewModel: vm)
        navigationController?.pushViewController(addTransactionVC, animated: true)
    }
    
    @objc func goBack() {
        navigationController?.popToRootViewController(animated: true)
        showTabBar(true)
    }
    
}

extension BalanceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("DEBUG: count \(allTransactions.count)")
      //  return expenses.count + income.count
        return allTransactions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as? TransactionCell
        cell?.configure(with: allTransactions[indexPath.row])
        return cell!
    }
}
