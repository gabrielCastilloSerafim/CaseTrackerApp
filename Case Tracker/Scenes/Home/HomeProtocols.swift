//
//  HomeProtocols.swift
//  Case Tracker
//
//  Created by Gabriel Castillo Serafim on 6/4/23.
//  
//

import UIKit

//MARK: - Current module VIPER protocols

// VIEW --> PRESENTER
protocol HomeViewToPresenter: BaseViperPresenter {}

// PRESENTER --> VIEW
protocol HomePresenterToView: BaseViperView {}

// PRESENTER --> INTERACTOR
protocol HomePresenterToInteractor: BaseViperInteractor {}

// PRESENTER --> ROUTER
protocol HomePresenterToRouter: BaseViperRouter {}

// INTERACTOR --> NETWORKLAYER
protocol HomeInteractorToNetWorkLayer: BaseViperNetworkLayer {}

// INTERACTOR --> PRESENTER
protocol HomeInteractorToPresenter: BaseViperPresenter {}

// NETWORKLAYER --> INTERACTOR
protocol HomeNetworkLayerToInteractor: BaseViperInteractor {}
