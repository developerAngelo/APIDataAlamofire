//
//  NetworkManager.swift
//  APIDataAlamofire
//
//  Created by Ruthlyn Huet on 7/14/21.
//

import Foundation
import Alamofire


class NetworkManager: NSObject {
    
    private enum NetworkPath: String{
        case request
        case posted
        
        static let baseUrl = ""
        var url: String{
            return NetworkPath.baseUrl + self.rawValue
        }
    }
    
    
    private struct NetworkParameter{
        
    }
    
    func getTweetRequest(byId requestId: String, completion: @escaping (Request?) -> Void){
        let urlString = ""
        AF.request(urlString).response{
            response in
            guard let data = response.data else {return}
            do{
                let decoder = JSONDecoder()
                let request = try decoder.decode(Request.self, from: data)
                completion(request)
            }catch let error{
                print(error)
                completion(nil)
            }
        }
    }
    
    func deletePost(byId requestId: String, completion: @escaping (Bool) -> Void){
        let urlString = NetworkPath.posted.url + "/" + requestId
        AF.request(urlString, method: .delete).responseString { (response) in
            switch response.result{
            case .success( _):
                completion(true)
            case .failure( _):
                completion(false)
            }
        }
    }
    
    
}
