//
//  Assembly.swift
//  TraineeProject
//
//  Created by Дмитрий Пономарев on 14.08.2023.
//

import Foundation

final class Assembly {
    
    public func createViewController(view: MainNewsFeedViewControllerProtocol) {
        let presenter = MainNewsFeedPresenter()
        let interactor = MainNewsFeedInteractor()
        let router = MainNewsFeedRouter()
        router.presenter = presenter
        presenter.router = router
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        view.presenter = presenter
    }
}
