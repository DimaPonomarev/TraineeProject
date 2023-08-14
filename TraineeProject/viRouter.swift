//
//  viRouter.swift
//  TraineeProject
//
//  Created by Дмитрий Пономарев on 14.08.2023.
//

import UIKit

protocol viRouterProtocol: AnyObject {
    var presenter: viPresentationProtocol? {get set}
}

final class viRouter: viRouterProtocol {
    
    weak var presenter: viPresentationProtocol?
}
