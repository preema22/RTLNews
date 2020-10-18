//
//  ArticleDetailViewController.swift
//  RTLNews
//
//  Created by Preema DSouza on 17/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ArticleDetailCell"

/// UITableViewController that presents a detailed article
class ArticleDetailViewController: UITableViewController {
    var viewModel: ArticleDetailViewModel!
    
    init(viewModel: ArticleDetailViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        // Register cell class
        self.tableView.register(ArticleDetailCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ArticleDetailCell
        cell.viewModel = ArticleDetailViewModel(article: viewModel.article)
        return cell
    }
    
}
