//
//  Api.swift
//  ureed
//
//  Created by mohammad hashom on 4/13/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import Foundation
import Alamofire
protocol ApiProtocol {
    func get(_ data:Any)
}
class Api{
    public var delegate :ApiProtocol?
    func getToken()->String{
        return User.token
    }
    
    func getHeader()->[String: String]{
        let headersParam=["Authorization":"JWT "+getToken()]
        
        return headersParam
    }
    func getBaseUrl()->String{
        return ApiSetting.API_URL
    }
    
    func getFullUrl(_ partialUrl:String)->String{
        return self.getBaseUrl() + partialUrl
    }
    
    func get( url:String,  params:[String: Any] ,callback:@escaping (Data)->Void){
        
        Alamofire.request(self.getFullUrl(url),  method: .get,parameters: params, encoding: JSONEncoding.default, headers: self.getHeader()).responseJSON { response in
            
            switch response.result {
            case .success(let JSON):
                callback(response.data!)
                
                
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
        
    }
    
    
    
    
    func post( url:String,  params:[String: Any] ,callback:@escaping (Any)->Void){
        
        Alamofire.request(self.getFullUrl(url),  method: .post,parameters: params, encoding: JSONEncoding.default, headers: self.getHeader()).responseJSON { response in
            
            switch response.result {
            case .success(let JSON):
                callback(JSON)
                
                
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
        
    }
    
    
    
    
}
