//
//  ExpensesViewController.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import UIKit

final class BalanceViewController: UIViewController {
    
    private var customView: BalanceView = BalanceView()
    
    var viewModel: BalanceViewModel
    
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
                for item in expenses {
                    if item.date == self.viewModel.date {
                        self.viewModel.allTransactions.append(item)
                    }
                }
              //  self.viewModel.allTransactions.append(contentsOf: expenses)
                print("DEBUG all expenses: \(self.viewModel.allTransactions)")
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
                for item in income {
                    if item.date == self.viewModel.date {
                        self.viewModel.allTransactions.append(item)
                    }
                }
             //   self.viewModel.allTransactions.append(contentsOf: income)
              //  self.allTransactions = income
                print("DEBUG all income: \(self.viewModel.allTransactions)")
                DispatchQueue.main.async {
                    self.customView.tableView.reloadData()
                }
            }
        }
    }
    
    func fetchAllTransactions() {
        fetchAllExpenses()
        fetchAllIncome()
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
        print("DEBUG: count \(viewModel.allTransactions.count)")
      //  return expenses.count + income.count
        return viewModel.allTransactions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as? TransactionCell
        cell?.configure(with: viewModel.allTransactions[indexPath.row])
        return cell!
    }
}
