//
//  ApiService.swift
//  DM126_Aula3
//
//  Created by user270232 on 11/23/24.
//

import Foundation
import Alamofire

struct APIService {
    private let url = "https://private-19efe-flaviohenriquemadureirabergamini.apiary-mock.com"
    
    func getGoals(completion: @escaping ([GoalType]?, Error?)-> Void) {
        let endpoint = "/goals"
        
     AF.request(url + endpoint).responseDecodable(of: [GoalType].self) {
         response in
         switch response.result{
            case .success(let goals):
             completion(goals, nil)
            default: break
         }
     }
    }
    
    func postImage(imageURL: String, completion: @escaping (Any?, Error?) -> Void) {
        let endpoint = "/image"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]

        let parameters: [String: Any] = [
            "image": imageURL
        ]
        
        AF.request(url + endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
}
