//
//  Movie.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    let title: String
    let desc: String
    let thumbnails: Thumbnails
}

extension Movie {
    
    enum CodingKeys: String, CodingKey {
        case title
        case desc = "description"
        case thumbnails
    }
}
