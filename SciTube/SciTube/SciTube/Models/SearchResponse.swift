//
//  SearchResponse.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import Foundation

struct SearchResponse: Codable {
    let items: [MovieWrapper]
}
