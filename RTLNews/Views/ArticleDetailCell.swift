//
//  ArticleDetailCell.swift
//  RTLNews
//
//  Created by Preema DSouza on 17/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import UIKit

/// UITableViewCell for ArticleDetailViewController
class ArticleDetailCell: UITableViewCell {
    
    let articleImageView = UIImageView(cornerRadius: 0)
    let titleLabel = UILabel(font: .boldSystemFont(ofSize: 20), numberOfLines: 0)
    let authorLabel = UILabel(font: .systemFont(ofSize: 15), numberOfLines: 0)
    let dateLabel = UILabel(font: .systemFont(ofSize: 12))
    let descriptionLabel = UILabel(font: .boldSystemFont(ofSize: 15), numberOfLines: 0)
    let contentLabel = UILabel(font: .systemFont(ofSize: 15), numberOfLines: 0)
    let articleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to article", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    var viewModel: ArticleDetailViewModel! {
        didSet {
            self.articleImageView.sd_setImage(with: viewModel.article.urlToImage)
            self.titleLabel.text = viewModel.article.title
            self.authorLabel.text = viewModel.article.author
            self.dateLabel.text = viewModel.formattedDate()
            self.descriptionLabel.text = viewModel.article.description
            self.contentLabel.text = viewModel.article.content
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// View setup for ArticleDetailCell
    private func setupView() {
        addSubview(articleImageView)
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        articleImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        articleImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        articleImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        articleImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        let stackView = UIStackView(arrangedSubviews: [
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
        stackView.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        stackView.spacing = 16
        dateLabel.textColor = .lightGray
        articleButton.addTarget(self, action: #selector(openLink), for: .touchUpInside)
    }
    
    /// Go to article button on click action
    @objc private func openLink() {
        guard UIApplication.shared.canOpenURL(viewModel.article.url) else {
            return
        }
        UIApplication.shared.open(viewModel.article.url)
    }
    
}
