//
//  MainNewsFeedRouter.swift
//  TraineeProject
//
//  Created by Дмитрий Пономарев on 14.08.2023.
//

import UIKit

protocol MainNewsFeedRouterProtocol: AnyObject {
    var presenter: MainNewsFeedPresentationProtocol? {get set}
    func openDescriptionVC(model: NewsFeed.Articles)
    func initAlert(withError error: Error)
}

final class MainNewsFeedRouter: MainNewsFeedRouterProtocol {
    
    //MARK: - MVP Properties

    weak var presenter: MainNewsFeedPresentationProtocol?
    
    //    MARK: - openDescriptionVC when user tap on Cell

    func openDescriptionVC(model: NewsFeed.Articles) {
        let descriptionVC = DescriptionNewsViewController()
        descriptionVC.configure(model)
        presenter?.view?.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
//    MARK: - initialize alert with some Error
    
    func initAlert(withError error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
        presenter?.view?.present(alert, animated: true)
    }
}
