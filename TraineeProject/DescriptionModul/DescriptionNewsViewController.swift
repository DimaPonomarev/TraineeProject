//
//  DescriptionNewsViewController.swift
//  TraineeProject
//
//  Created by Дмитрий Пономарев on 14.08.2023.
//

import UIKit
import SnapKit

class DescriptionNewsViewController: UIViewController {
    
    //MARK: - UI properties
    
    let pictureOfNews = WebImageView()
    let headerOfNews = UILabel()
    let descriptionOfNews = UILabel()
    let dateOfNews = UILabel()
    let urlSourceOfNews = UILabel()
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Public Methods
    
    func configure(_ model: NewsFeed.Articles) {
        pictureOfNews.setWeatherImage(imageUrl: model.urlToImage)
        headerOfNews.text = model.title
        descriptionOfNews.text = model.description
        urlSourceOfNews.text = model.url
    }
}

private extension DescriptionNewsViewController {

    //MARK: - setupUI
    
    func setupUI() {
        addViews()
        makeConstraints()
        setupViews()
        addGesture()
    }

    //MARK: - addViews

    func addViews() {
        view.addSubview(pictureOfNews)
        view.addSubview(headerOfNews)
        view.addSubview(descriptionOfNews)
        view.addSubview(dateOfNews)
        view.addSubview(urlSourceOfNews)
    }
    
    //MARK: - makeConstraints

    func makeConstraints() {
        pictureOfNews.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(200)
        }
        headerOfNews.snp.makeConstraints {
            $0.top.equalTo(pictureOfNews.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        descriptionOfNews.snp.makeConstraints {
            $0.top.equalTo(headerOfNews.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        urlSourceOfNews.snp.makeConstraints {
            $0.top.equalTo(descriptionOfNews.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    //MARK: - setupViews

    func setupViews() {
        view.backgroundColor = .white
        pictureOfNews.contentMode = .scaleAspectFit
        headerOfNews.numberOfLines = 0
        headerOfNews.font = .boldSystemFont(ofSize: 20)
        descriptionOfNews.numberOfLines = 0
        urlSourceOfNews.textColor = .blue
    }
    
    //  MARK: - addGesture
    
    func addGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnURLAdressLabel))
        urlSourceOfNews.isUserInteractionEnabled = true
        urlSourceOfNews.addGestureRecognizer(tap)
    }
        
    @objc func tapOnURLAdressLabel() {
        guard let url = URL(string: urlSourceOfNews.text ?? "") else { return }
        let vc = WebViewViewController(url: url, title: headerOfNews.text ?? "")
        navigationController?.pushViewController(vc, animated: true)
    }
}
