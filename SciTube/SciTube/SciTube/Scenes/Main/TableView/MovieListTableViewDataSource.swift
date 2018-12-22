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
    var movies: [Movie] = []
    
    // MARK: IBActions
    
    // MARK: Implementation
    public func sortMoviesByDescriptionLengthAscending(_ movies: [Movie]) -> [Movie] {
        return movies.sorted(by: { (first, second) -> Bool in
            return first.desc.count < second.desc.count
        })
    }
}

// MARK: - UITableViewDataSource
extension MovieListTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: MovieTableViewCell.self, forIndexPath: indexPath)
        configureMovieCell(cell, for: indexPath)
        return cell
    }
    
    private func configureMovieCell(_ cell: MovieTableViewCell, for indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        cell.setupCell(title: movie.title, movieDescription: movie.desc, miniatureUrl: movie.thumbnails.standard.url)
    }
}
