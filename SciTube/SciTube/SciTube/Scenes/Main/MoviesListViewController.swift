//
//  MoviesListViewController.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import UIKit

final class MoviesListViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Constants
    private let tableViewDataSource = MovieListTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupTableView()
        
        APIClient.getMovies { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let searchResponse):
                let movies = searchResponse.items.compactMap { return $0.movie }
                strongSelf.tableViewDataSource.movies = strongSelf.tableViewDataSource.sortMoviesByDescriptionLengthAscending(movies)
                strongSelf.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupNavigationBar() {
        self.title = "SciTube"
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: Colors.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        self.navigationController?.navigationBar.barTintColor = Colors.main
        self.navigationController?.navigationBar.tintColor = Colors.white
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupTableView() {

        tableView.registerNib(forClass: MovieTableViewCell.self)
        tableView.dataSource = tableViewDataSource
        tableView.allowsSelection = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
    }
}
