//
//  HomeViewController.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 11/30/23.
//

import UIKit
import SwiftUI

@available(iOS 16.0, *)


final class HomeViewController: UIViewController, 
                                UICalendarViewDelegate,
                                UICalendarSelectionSingleDateDelegate {
    
    let customHeader = CustomHeader(title: "Home", hideBackButton: true)
    
    var date = DateComponents()
   
    let calendarView: UICalendarView = {
        let calendar = UICalendarView()
        calendar.calendar = .current
        calendar.locale = .current
        calendar.fontDesign = .monospaced
        return calendar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupUI()
        
        calendarView.delegate = self
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
        
//        let date = DateComponents(
//            calendar: Calendar(identifier: .gregorian),
//            year: 2024,
//            month: 2,
//            day: 14
//        )
//
//
//        // Programmatically set the selected date.
//        dateSelection.selectedDate = date
        
        customHeader.backButton.addTarget(self, action: #selector(navToExpense), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //showTabBar(true)
    }
    
    func setupUI() {
        view.addSubview(customHeader)
        view.addSubview(calendarView)
        
        customHeader.anchor(top: view.topAnchor, 
                            left: view.leftAnchor,
                            right: view.rightAnchor, 
                            paddingTop: 0,
                            height: 120)
        calendarView.anchor(top: customHeader.bottomAnchor,
                            left: view.leftAnchor,
                            right: view.rightAnchor,
                            paddingTop: 30,
                            paddingLeft: 24,
                            paddingRight: 24)
    }
    
    @objc func navToExpense(date: DateComponents) {
        let vm = BalanceViewModel(date: date.date ?? Date())
        let expenseVC = BalanceViewController(viewModel: vm)
        navigationController?.pushViewController(expenseVC, animated: true)
        showTabBar(false)
    }
}

@available(iOS 16.0, *)
extension HomeViewController {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        navToExpense(date: dateComponents ?? DateComponents())
    }
    
    func dateSelection(
        _ selection: UICalendarSelectionSingleDate,
        canSelectDate dateComponents: DateComponents?
    ) -> Bool {
        // Allow all dates by returning true if the selection parameter contains
        // a date component instance. Prevent someone from clearing the selection
        // by returning false if the selection parameter is nil.
        return dateComponents != nil
    }
}

