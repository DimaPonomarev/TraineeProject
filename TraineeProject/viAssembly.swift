//
//  viAssembly.swift
//  TraineeProject
//
//  Created by Дмитрий Пономарев on 14.08.2023.
//

import UIKit

final class viAssembly {
    
    func configurate(_ vc: viDisplayLogic) {
        let presenter = viPresenter()
        let router = viRouter()
        vc.presenter = presenter
        presenter.viewController = vc
        presenter.router = router
        router.presenter = presenter
    }
}
