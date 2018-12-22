//
//  JSONDecoderExtension.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import Foundation
import Alamofire

extension JSONDecoder {

    func decodeResponse<T: Decodable>(_ type: T.Type, from response: DataResponse<Data>) -> Result<T> {
        guard response.error == nil else {
            print(response.error!)
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            print("didn't get any data from API")
            return .failure(CustomError.invalidResponse)
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            print("error trying to decode response")
            print(error)
            return .failure(error)
        }
    }
}
