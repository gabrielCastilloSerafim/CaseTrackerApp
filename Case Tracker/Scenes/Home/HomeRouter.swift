//
//  HomeRouter.swift
//  Case Tracker
//
//  Created by Gabriel Castillo Serafim on 6/4/23.
//  
//

import UIKit

class HomeRouter: HomePresenterToRouter {
    
    static func createModule() -> UIViewController {
        
        let view = HomeView()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let networkLayer = HomeNetworkLayer()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.netWorkLayer = networkLayer
        networkLayer.interactor = interactor
        
        return view
    }
    
}

