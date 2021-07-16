//
//  Request.swift
//  APIDataAlamofire
//
//  Created by Ruthlyn Huet on 7/14/21.
//

import Foundation


struct Request: Codable {
    let requestId: Int?
    let deviceToken: String?
    let hashtags: String?
    
    private enum CodingKeys: String, CodingKey{
        case requestId = "id"
        case deviceToken = "device_token"
        case hashtags
    }
    
}
