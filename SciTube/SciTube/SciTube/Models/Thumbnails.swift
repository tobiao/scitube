//
//  Thumbnails.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import Foundation

struct Thumbnails: Codable {
    
    let standard: Thumbnail
    let medium: Thumbnail
    let high: Thumbnail
}

extension Thumbnails {
    
    enum CodingKeys: String, CodingKey {
        case standard = "default"
        case medium
        case high
    }
}
