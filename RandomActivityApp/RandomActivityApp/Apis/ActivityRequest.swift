//
//  ActivityRequest.swift
//  RandomActivityApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 01/09/21.
//

import Foundation
import Alamofire

enum ActivityError: Error{
    case responseError
    case dataError
    case decodeError
}

struct ActivityRequest {
    let url = "https://www.boredapi.com/api/activity"
    
    func getRandom(complition: @escaping (Result<Activity, ActivityError>) -> Void){
        AF.request(url).response { response in
            if response.error != nil {
                print(response.error!)
                complition(.failure(.responseError))
                return
            }
            
            guard let data = response.data else{
                complition(.failure(.dataError))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let activity = try decoder.decode(Activity.self, from: data)
                complition(.success(activity))
            }
            catch{
                print(error)
                complition(.failure(.decodeError))
            }
        }
    }
}
