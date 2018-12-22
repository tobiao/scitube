//
//  MovieListTableViewDataSource.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import UIKit

final class MovieListTableViewDataSource: NSObject {
    
    // MARK: Constants
    
    // MARK: Variables
    
    // MARK: IBActions
    
    // MARK: Implementation
}

// MARK: - UITableViewDataSource
extension MovieListTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //TODO: remove placeholder
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: MovieTableViewCell.self, forIndexPath: indexPath)
        configureMovieCell(cell, for: indexPath)
        return cell
    }
    
    private func configureMovieCell(_ cell: MovieTableViewCell, for indexPath: IndexPath) {
        // TODO: add configuration
    }
}
