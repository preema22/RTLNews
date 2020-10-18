//
//  ArticleCell.swift
//  RTLNews
//
//  Created by Preema DSouza on 16/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import UIKit
import SDWebImage

/// UICollectionViewCell for ArticlesViewController
class ArticleCell: UICollectionViewCell {
    
    let titleLabel = UILabel(font: .boldSystemFont(ofSize: 15), numberOfLines: 0)
    let articleImageView = UIImageView(cornerRadius: 5)
    
    var viewModel: ArticleCellViewModel! {
        didSet {
            articleImageView.sd_setImage(with: viewModel.articleImage)
            titleLabel.text = viewModel.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// View setup for ArticleCell
    private func setupView() {
        let stackView = UIStackView(arrangedSubviews: [articleImageView, titleLabel])
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        stackView.spacing = 10
        articleImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35).isActive = true
    }
    
}
