//
//  ApiBaceService.swift
//  ureed
//
//  Created by mohammad hashom on 4/19/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import Foundation
import Alamofire

class ApiBaseService{
    var api=Api()
    var delegate:ApiBaseProtocol?
    
    var moduleUrl:String {get{return ""}set{}}

    func request<DecodableGeneric:Decodable>( url:String?=nil,params:[String:Any]=[:],method:HTTPMethod = .get,decodable:DecodableGeneric.Type?=nil  ,callback:( (Any)->Void)?=nil ){
        let url = url ?? moduleUrl
        
        self.api.request(url: url ,method:method,params: params,callback:{
            data,jsonData  in
            guard let decodable = decodable else{
                guard let callback = callback else{
                    return
                }
                callback(data)
                return
            }
           // var decodable:Decodable = self.DecodableType as! ApiBaseDecodable
            guard let callback = callback else{
                do{
                    let modelData = try JSONDecoder().decode(decodable.self, from: data  )
                    switch method{
                    case .get:
                        self.delegate?.get(modelData)
                    case .post:
               
                        self.delegate?.post(modelData)
                        
                    case .options:
                        self.delegate?.options(modelData)
                    case .head:
                        self.delegate?.head(modelData)
                    case .put:
                        self.delegate?.put(modelData)
                    case .patch:
                        self.delegate?.patch(modelData)
                    case .delete:
                        self.delegate?.delete(modelData)
                    case .trace:
                        self.delegate?.trace(modelData)
                    case .connect:
                        self.delegate?.connect(modelData)
                    }
                }catch let error{
                    
                    let jsonData = jsonData as? NSDictionary
                    self.delegate?.errorDecode(jsonData)
                    print(error)}
                
                return }
           
            
            /*___________________not reachable*/
            do{
                let modelData = try JSONDecoder().decode(decodable.self, from: data  )
            callback(modelData)
                  }catch let error{
                    let jsonData = jsonData as? NSDictionary
                    self.delegate?.errorDecode(jsonData)
                    print(error)


            }
            /*________________END___not reachable*/
            
            
        })// (self.delegate?.getList)!)
    }
    
    
    
    
    


  
    
}
