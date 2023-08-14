//
//  DescriptionTableViewCell.swift
//  TraineeProject
//
//  Created by Дмитрий Пономарев on 14.08.2023.
//

import UIKit

final class MainNewsFeedTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    //MARK: - UI properties
    
    private let pictureOfNews = WebImageView()
    private let headerOfNews = UILabel()
    private let descriptionOfNews = UILabel()
    private let dateOfNews = UILabel()
    
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pictureOfNews.image = nil
    }
    
    // MARK: - Public Methods
    
    func configureView(_ model: NewsFeed.Articles) {
        pictureOfNews.setWeatherImage(imageUrl: model.urlToImage)
        headerOfNews.text = model.title
        descriptionOfNews.text = model.description
        dateOfNews.text = model.publishedAt
    }
}

//MARK: - Private methods

private extension MainNewsFeedTableViewCell {
    
    //MARK: - Setup
    
    func setup() {
        addViews()
        makeConstraints()
        setupViews()
    }
    
    //MARK: - addViews
    
    func addViews() {
        contentView.addSubview(pictureOfNews)
        contentView.addSubview(headerOfNews)
        contentView.addSubview(descriptionOfNews)
        contentView.addSubview(dateOfNews)

    }
    
    //MARK: - makeConstraints
    
    func makeConstraints() {
        headerOfNews.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.left.equalToSuperview().inset(20)
            $0.width.equalTo(200)
        }
        pictureOfNews.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.right.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(5)
            $0.left.equalTo(headerOfNews.snp.right).offset(20)
        }

        descriptionOfNews.snp.makeConstraints {
            $0.top.equalTo(headerOfNews.snp.bottom).offset(5)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalTo(pictureOfNews.snp.left).inset(-20)
        }
        dateOfNews.snp.makeConstraints {
            $0.top.equalTo(descriptionOfNews.snp.bottom).priority(100)
            $0.left.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(5)
        }
    }
    
    //MARK: - setupViews
    
    func setupViews() {
        
        headerOfNews.font = .preferredFont(forTextStyle: .headline)
        headerOfNews.numberOfLines = 3
        descriptionOfNews.font = .preferredFont(forTextStyle: .caption1)
        descriptionOfNews.numberOfLines = 4
        dateOfNews.textColor = .gray
        dateOfNews.font = .systemFont(ofSize: 7)
        pictureOfNews.contentMode = .scaleAspectFit
    }
}
