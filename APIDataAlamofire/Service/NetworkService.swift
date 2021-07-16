//
//  NetworkService.swift
//  APIDataAlamofire
//
//  Created by Ruthlyn Huet on 7/16/21.
//

import Foundation
import Alamofire

    
class NetworkService{
    
    fileprivate var baseUrl = ""
    typealias coutriesCallBack = (_ countries: [Country]?,  _ status: Bool,  _ message: String) -> Void
    
    var callBack: coutriesCallBack?

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    
    func getAllCountry(endpoint: String){
        AF.request(self.baseUrl + endpoint, method: .get,
                   parameters: nil, encoding: URLEncoding.default,
                   headers: nil, interceptor: nil).response
            { (responseData) in
                    guard let data = responseData.data else {
                        self.callBack?(nil, false, "")
                        return}
                    do{
                        let countries = try JSONDecoder().decode([Country].self, from: data)
                        print("Countries == \(countries)")
                        self.callBack?(countries, true, "")
                    }catch{
                        print("Error decoding == \(error)")
                        self.callBack?(nil, false, error.localizedDescription)
                    }
                   }
    }
    
    func completionHandler(callBack: @escaping coutriesCallBack){
        self.callBack = callBack
    }
}
