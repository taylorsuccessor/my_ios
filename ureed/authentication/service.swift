//
//  service.swift
//  ureed
//
//  Created by mohammad hashom on 4/16/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import Foundation

class AuthenticationService{
    var api=Api()
    var delegate:AuthenticationProtocol? = nil
    let moduleUrl="messaging/conversation/"
    
    func getList(params:[String:Any]=[:]) {
        
        self.api.get(url: moduleUrl ,params: params,callback: (self.delegate?.get)!);
    }
    
    
    
    
}

protocol AuthenticationProtocol {
    func get(_ data: Any)
}
