//
//  ArticlesViewController.swift
//  RTLNews
//
//  Created by Preema DSouza on 17/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

/// UICollectionViewController that presents news feed/article overview
class ArticlesViewController: UICollectionViewController {
    
    private var activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .gray)
        aiv.color = .darkGray
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    private var viewModel: ArticlesViewModel! {
        didSet {
            viewModel.articles.bind { [weak self] _ in
                DispatchQueue.main.async {
                    self?.activityIndicatorView.stopAnimating()
                    self?.collectionView.reloadData()
                }
            }
            viewModel.errorMessage.bindAndFire { [weak self] errorMessage in
                if let message = errorMessage, !message.isEmpty {
                    DispatchQueue.main.async {
                        self?.activityIndicatorView.stopAnimating()
                        self?.showAlertView(with: message)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        // View model instantiation and fetch news feed from API
        viewModel = ArticlesViewModel()
        viewModel.fetchNewsFeed()
        setupView()
        // Register cell class
        self.collectionView!.register(ArticleCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    /// View set up foo ArticlesViewController
    private func setupView() {
        collectionView.backgroundColor = .white
        view.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        activityIndicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        activityIndicatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        activityIndicatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfArticles()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArticleCell
        cell.viewModel = viewModel.articleCellViewModel(for: indexPath.item)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let articleDetailViewModel = viewModel.articleDetailViewModel(for: indexPath.item)
        let articleViewController = ArticleDetailViewController(viewModel: articleDetailViewModel)
        navigationController?.pushViewController(articleViewController, animated: true)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ArticlesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

// MARK: - AlertView for API error

extension ArticlesViewController {
    func showAlertView(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
