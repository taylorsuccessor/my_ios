//
//  ApiBaceService.swift
//  ureed
//
//  Created by mohammad hashom on 4/19/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import Foundation

class ApiBaseService<ModelDecodable: Decodable>{
    var api=Api()
    var delegate:ApiBaseProtocol?
   
    
    var moduleUrl:String {get{return ""}set{}}
    
    func getList(params:[String:Any]=[:]) {
        
        self.api.get(url: moduleUrl ,params: params,callback:{successResult in
            
            do{
                let myStruct = try JSONDecoder().decode(ModelDecodable.self, from: successResult  )
                self.delegate?.getList(myStruct)
            }catch let error{print(error)}
            
        })// (self.delegate?.getList)!)
    }
    
}
