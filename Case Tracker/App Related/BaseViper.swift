//
//  BaseViper.swift
//  Case Tracker
//
//  Created by Gabriel Castillo Serafim on 6/4/23.
//

import Foundation

//MARK: - Base generic VIPER protocols

// VIEW
protocol BaseViperView: AnyObject {
    
    associatedtype P: BaseViperPresenter
    
    var presenter: P? { get }
}

// INTERACTOR
protocol BaseViperInteractor: AnyObject {
    
    associatedtype P: BaseViperPresenter
    associatedtype N: BaseViperNetworkLayer
    
    var presenter: P? { get }
    var netWorkLayer: N? { get }
}

// PRESENTER
protocol BaseViperPresenter: AnyObject {
    
    associatedtype V: BaseViperView
    associatedtype I: BaseViperInteractor
    associatedtype R: BaseViperRouter
    
    var view: V? { get }
    var interactor: I? { get }
    var router: R? { get }
}

// ROUTER
protocol BaseViperRouter: AnyObject {}

// NETWORKLAYER
protocol BaseViperNetworkLayer: AnyObject {
    
    associatedtype I: BaseViperInteractor
    
    var interactor: I? { get }
}
