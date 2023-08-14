//
//  Presenter.swift
//  TraineeProject
//
//  Created by Дмитрий Пономарев on 14.08.2023.
//

import Foundation

protocol MainNewsFeedPresentationProtocol: AnyObject {
    
    var view: MainNewsFeedViewControllerProtocol? { get set }
    func getResponseFromInteractor(newsFeed: NewsFeed)
    func makeRequestToInteractor(choosenTheme: String)
    var modelForTableView: [NewsFeed.Articles]? { get set }
    var router: MainNewsFeedRouterProtocol? { get }
    func openDescriptionVC(model: NewsFeed.Articles)
    func getErrorFromInteractor(_ error: Error)
}

final class MainNewsFeedPresenter: MainNewsFeedPresentationProtocol {
    
    //MARK: - MVP Properties
    
    weak var view: MainNewsFeedViewControllerProtocol?
    var interactor: MainNewsFeedInteractorProtocol?
    var router: MainNewsFeedRouterProtocol?
    
    //MARK: - Data variables

    var modelForTableView: [NewsFeed.Articles]?
    
    // MARK: - Delegate Methods

    func getResponseFromInteractor(newsFeed: NewsFeed) {
        modelForTableView = newsFeed.articles
        view?.passedDataFromPresenterToViewController(newsFeed: newsFeed)
    }
    
    //    MARK: - tell to Router to open AlertController with Error
    
    func getErrorFromInteractor(_ error: Error) {
        router?.initAlert(withError: error)
        
    }
    
    //    MARK: - makeRequestToInteractor

    func makeRequestToInteractor(choosenTheme: String) {
        interactor?.makeRequest(theme: choosenTheme)
    }
    
    //    MARK: - tell Router to open DescriptionVC

    func openDescriptionVC(model: NewsFeed.Articles) {
        router?.openDescriptionVC(model: model)
    }
}
