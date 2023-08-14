//
//  APIClient.swift
//  TraineeProject
//
//  Created by Дмитрий Пономарев on 14.08.2023.
//

import Foundation


//MARK: - Enum APINewsFeedURLPath

struct  APINewsFeed {
    static let baseURL = "https://newsapi.org/"
    private let APIKey = "9ea828d6da64493ea4347a3182af9dac"
    private var theme: String
    var path: String
    
    init(theme: String) {
        self.theme = theme
        self.path = "v2/everything?q=\(theme)&from=2023-07-14&sortBy=publishedAt&apiKey=\(self.APIKey)"
    }
}

struct ChoosenThemee  {
    let theme: String
}

final class APINewsFeedRequest: DataFetcherProtocol {
    
    public func getWeather(choosenTheme:ChoosenThemee, complition: @escaping ((Result<Any>) -> Void)) {
        makeDataTask(urlRequest: makeURLRequest(choosenTheme: choosenTheme), type: NewsFeed.self, complitionHandler: complition)
    }
}

private extension APINewsFeedRequest {
    
    func makeURL(choosenTheme: ChoosenThemee) -> URL? {
        let urlString = "\(APINewsFeed.baseURL)\(APINewsFeed(theme: choosenTheme.theme).path)"
        let url = URL(string: urlString)
        return url
    }
    
    func makeURLRequest(choosenTheme: ChoosenThemee) -> URLRequest? {
        guard let url = makeURL(choosenTheme: choosenTheme) else { return nil }
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
}







