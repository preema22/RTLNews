//
//  ArticleTableViewCell.swift
//  RTLNews
//
//  Created by Preema DSouza on 17/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import UIKit

class ArticleDetailCell: UITableViewCell {
    
    let articleImageView = UIImageView(cornerRadius: 0)
    let titleLabel = UILabel(font: .boldSystemFont(ofSize: 15), numberOfLines: 0)
    let authorLabel = UILabel(font: .systemFont(ofSize: 15), numberOfLines: 0)
    let dateLabel = UILabel(font: .systemFont(ofSize: 12))
    let descriptionLabel = UILabel(font: .systemFont(ofSize: 13), numberOfLines: 0)
    let contentLabel = UILabel(font: .systemFont(ofSize: 12), numberOfLines: 0)
    let articleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to article", for: .normal)
        return button
    }()
    
    var viewModel: ArticleDetailViewModel! {
        didSet {
            viewModel.article.bindAndFire() { [unowned self] article in
                self.articleImageView.sd_setImage(with: article.urlToImage)
                self.titleLabel.text = article.title
                self.authorLabel.text = article.author
                self.dateLabel.text = article.publishedAt
                self.descriptionLabel.text = article.description
                self.contentLabel.text = article.content
            }
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        articleImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        let stackView = UIStackView(arrangedSubviews: [
            articleImageView,
            titleLabel,
            authorLabel,
            dateLabel,
            descriptionLabel,
            contentLabel,
            articleButton
        ])
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.spacing = 16
    }
    
}
