//
//  HomeInteractor.swift
//  Case Tracker
//
//  Created by Gabriel Castillo Serafim on 6/4/23.
//  
//

import Foundation

//MARK: - INTERACTOR --> NETWORKLAYER
//MARK: - INTERACTOR --> PRESENTER
class HomeInteractor: HomePresenterToInteractor {
    
    weak var presenter: HomePresenter?
    var netWorkLayer: HomeNetworkLayer?
    
    func getCurrentFormattedDate() -> String {
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        var dateFormat = "dd/MM/yyyy"
        
        if Locale.current.languageCode == "en" {
            dateFormat = "MM/dd/yyyy"
        }
        
        dateFormatter.dateFormat =  dateFormat
        
        return dateFormatter.string(from: currentDate)
    }
}

//MARK: - INTERACTOR <-- NETWORKLAYER
extension HomeInteractor: HomeNetworkLayerToInteractor {
    
    
}
