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
        tableView.rowHeight = 160
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
    }
}
