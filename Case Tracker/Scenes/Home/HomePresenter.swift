//
//  HomePresenter.swift
//  Case Tracker
//
//  Created by Gabriel Castillo Serafim on 6/4/23.
//  
//

import UIKit

//MARK: - PRESENTER --> VIEW
//MARK: - PRESENTER --> INTERACTOR
//MARK: - PRESENTER --> ROUTER
class HomePresenter: HomeViewToPresenter {
    
    weak var view: HomeView?
    var interactor: HomeInteractor?
    var router: HomeRouter?
    var tableViewDataSource = [MyCase]()
    
    func viewDidLoad() {
        configureView()
    }
    
    
    private func configureView() {
        
        // Set date label's text with current formatted date
        view?.setDateLabelText(date: interactor?.getCurrentFormattedDate())
        
        // Set fake tableView datasource
        var counter = 0
        
        for _ in 0...4 {
            
            switch counter {
                
            case 0:
                let myCase = MyCase(
                    title: "Work Visa",
                    trackingId: "YHJ6J&G8NGY98BG7HJ",
                    statusDetails: "Missing documents.",
                    lastUpdated: "11/02/2023",
                    style: .pending)
                tableViewDataSource.append(myCase)
                
            case 1:
                let myCase = MyCase(
                    title: "Study Visa",
                    trackingId: "YHJ6J&G8NGY98BG7HJ",
                    statusDetails: "Waiting for staff approval.",
                    lastUpdated: "19/01/2023",
                    style: .pending)
                tableViewDataSource.append(myCase)
                
            case 2:
                let myCase = MyCase(
                    title: "Green Card",
                    trackingId: "YHJ6J&G8NGY98BG7HJ",
                    statusDetails: "Congratulations, case approved!",
                    lastUpdated: "15/02/2023",
                    style: .approved)
                tableViewDataSource.append(myCase)
                
            case 3:
                let myCase = MyCase(
                    title: "Drivers License",
                    trackingId: "YHJ6J&G8NGY98BG7HJ",
                    statusDetails: "Congratulations case approved!",
                    lastUpdated: "01/03/2023",
                    style: .approved)
                tableViewDataSource.append(myCase)
                
            default:
                break
            }
            counter += 1
        }
        view?.tableViewReloadData()
        
    }
}

//MARK: - PRESENTER <-- INTERACOTOR
extension HomePresenter: HomeInteractorToPresenter {
    
    
}
