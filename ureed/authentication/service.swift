//
//  service.swift
//  ureed
//
//  Created by mohammad hashom on 4/16/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import Foundation

class LoginSuccessResult:Decodable{
    
      var token:String = ""
    
}

class AuthenticationService :ApiBaseService {
    
    override var moduleUrl:String {get {return "api-token-auth/"} set{}}

}

protocol LoginProtocol:ApiBaseProtocol{
    
}
