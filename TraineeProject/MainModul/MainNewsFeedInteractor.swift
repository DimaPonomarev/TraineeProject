//
//  Interactor.swift
//  TraineeProject
//
//  Created by Дмитрий Пономарев on 14.08.2023.
//

import Foundation

protocol MainNewsFeedInteractorProtocol: AnyObject {
    func makeRequest(theme: String)
}

final class MainNewsFeedInteractor: MainNewsFeedInteractorProtocol {
    var presenter: MainNewsFeedPresentationProtocol?
    let api = APINewsFeedRequest()
    
    func makeRequest(theme: String) {
        api.getWeather(choosenTheme: ChoosenTheme(theme: theme)) { [weak self] (result) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .succes(let result):
                    self.presenter?.getResponseFromNetwork(newsFeed: result as! NewsFeed)
                    
                case .failure(let error):
                    self.presenter?.getErrorFromNetwork(error)
                    print(error)
                    
                }
            }
        }
    }
}
