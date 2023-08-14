//
//  ViewController.swift
//  TraineeProject
//
//  Created by Дмитрий Пономарев on 14.08.2023.
//

import UIKit
import SnapKit

protocol MainNewsFeedViewControllerProtocol: UIViewController {
    func passedDataFromPresenterToViewController(newsFeed: NewsFeed)
    var presenter: MainNewsFeedPresentationProtocol? { get set }

}

final class MainNewsFeedViewController: UIViewController {
    
    //MARK: - MVP Properties

    var presenter: MainNewsFeedPresentationProtocol?
    
    //MARK: - UI properties
    
    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()
    
    //MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        selfConfigurate()
        presenter?.makeRequestToInteractor(choosenTheme: "economic")
    }
}

//MARK: - Private methods

private extension MainNewsFeedViewController {
    
    // MARK: - Self configurate
    
    func selfConfigurate() {
        let assembly = Assembly()
        assembly.createViewController(view: self)
    }
    
    //MARK: - setupUI
    
    func setupUI() {
        addViews()
        makeConstraints()
        setupViews()
    }
    
    //MARK: - addViews

    func addViews() {
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
    }
    
    //MARK: - makeConstraints

    func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    //MARK: - setupViews

    func setupViews() {
        tableView.register(MainNewsFeedTableViewCell.self, forCellReuseIdentifier: MainNewsFeedTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc func refresh() {
        presenter?.makeRequestToInteractor(choosenTheme: "economic")
    }
}

extension MainNewsFeedViewController: MainNewsFeedViewControllerProtocol {
    
    func passedDataFromPresenterToViewController(newsFeed: NewsFeed) {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension MainNewsFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.modelForTableView?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainNewsFeedTableViewCell.identifier, for: indexPath) as? MainNewsFeedTableViewCell else { return UITableViewCell() }
        guard let modelForCell = presenter?.modelForTableView?[indexPath.row] else { return UITableViewCell()}
        
        cell.configureView(modelForCell)
        return cell
    }
}

extension MainNewsFeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = presenter?.modelForTableView?[indexPath.row] else { return }
        presenter?.openDescriptionVC(model: model)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


