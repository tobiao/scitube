//
//  Constants.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import UIKit

struct ProductionServer {
    static let baseURL = "http://api.norbsoft.com/sciTube/v2"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

struct Colors {

    private init() { }
    
    static let main = UIColor.green
    static let white = UIColor.white
    static let textGray = UIColor.darkGray
    static let textWhite = UIColor.white
}

struct Fonts {

    private init() { }
    
    // regular
    static let regular14 = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
    static let regular16 = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
}
