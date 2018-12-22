//
//  APIClient.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import Alamofire

class APIClient {
    
    static func getMovies(completion: @escaping (Result<SearchResponse>) -> Void) {

        Alamofire.request(MoviesEndpoint.movies)
            .responseData { response in
                let decoder = JSONDecoder()
                let data: Result<SearchResponse> = decoder.decodeResponse(SearchResponse.self, from: response)
                completion(data)
        }
    }
}
