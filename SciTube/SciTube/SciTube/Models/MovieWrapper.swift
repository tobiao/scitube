//
//  MovieWrapper.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import Foundation

struct MovieWrapper: Codable {
    
    let movie: Movie
}

extension MovieWrapper {
    
    enum CodingKeys: String, CodingKey {
        case movie = "snippet"
    }
}
