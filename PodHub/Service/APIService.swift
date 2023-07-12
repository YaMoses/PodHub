//
//  APIService.swift
//  PodHub
//
//  Created by Yamoses on 22/05/2023.
//

import Foundation
import Alamofire

class APIService {
    
    let baseiTunesSearchUrl = "https://itunes.apple.com/search"
    
    static let shared = APIService()
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {
        let parameters = ["term": searchText, "media": "podcast"]

        
        AF.request(baseiTunesSearchUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (responseData) in
            
            print("Searching...")
            if let err = responseData.error {
                print("Failed to establish connection", err)
                return
            }

            guard let data = responseData.data else {return}

            do {
                print(3)
                let searchResult = try JSONDecoder().decode(Search.self, from: data)
                print("Result count: ",searchResult.resultCount)
                completionHandler(searchResult.results)
            } catch let decodeerror {
                print("Failed to decode", decodeerror.localizedDescription)
            }
        }
        print(2)
    }
}
