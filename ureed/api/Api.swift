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
        
        var headersParam:[String:String]=[:]
        let token=getToken()
        if(token != ""){
            headersParam = ["Authorization":"JWT "+token]
        }
        
        return headersParam
    }
    func getBaseUrl()->String{
        return ApiSetting.API_URL
    }
    
    func getFullUrl(_ partialUrl:String)->String{
        return self.getBaseUrl() + partialUrl
    }
    
    func request( url:String,method:HTTPMethod = .get ,  params:[String: Any] ,callback:@escaping (Data,Any)->Void){
        //URLEncoding.default//JSONEncoding.default
//        let encoding = (method == .get) ? URLEncoding.default:JSONEncoding.default
        Alamofire.request(self.getFullUrl(url),  method: method,parameters: params, encoding: ((method == .get) ? URLEncoding.default:JSONEncoding.default), headers: self.getHeader()).responseJSON { response in
            
            switch response.result {
            case .success(let JSON):
                callback(response.data!,JSON )
                
                
            case .failure(let error):
                
                print("Request failed with error: \(error)")
            }
        }
        
    }
    
    
    
    
 
    
    
    
    
}
