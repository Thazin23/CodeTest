//
//  APIManager.swift
//  CodeTest
//
//  Created by Thazin Nwe on 20/08/2024.
//

import Foundation
import Alamofire

class APIManager: NSObject{
    
    static let share = APIManager()
    
    // MARK: Get Methods
    func getAuthor(page: Int ,success successCallback: @escaping ([Author]) -> Void){
        
        guard let url = URL(string: "\(Constant.getAuthorPath)page=\(page)&limit=20") else {
            return
        }
        
        AF.request(url, method: .get,  parameters: nil, encoding: JSONEncoding.default)
            .responseDecodable(of:[Author].self) { response in
                
                switch response.result {
                                
                case .success(let data):
                    print("success: \(page)")
                    successCallback(data)
                case .failure(let fetchErr):
                    print("fail: \(fetchErr)")
                }
               
        }
        
        
    }
    
   
    
}
