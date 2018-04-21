//
//  Jwt.swift
//  ureed
//
//  Created by mohammad hashom on 4/20/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import Foundation
import JWTDecode

class UserModel {
    var user_id : Int? = 0
        var email : String? = ""
        var username : String? = ""
        var exp : Int? = 0
        var is_remember_me : Bool?  = false
        var orig_iat : Int?  = 0
        var user_type : String? = ""
        var employer_id : Int? = 0
        var balance : Double?  = 0
        var picture : String? = ""
        var status : String? = ""
        var display_name : String? = ""
        var favorite_freelancers : [String]? = [""]
        var atibiUserType : [String]? = [""]
        
    init?(dictionary:[String: Any]){
        self.user_id = dictionary["user_id"] as? Int
        self.email = dictionary["email"] as? String
        self.username = dictionary["username"] as? String
        self.exp = dictionary["exp"] as? Int
        self.is_remember_me = dictionary["is_remember_me"] as? Bool
        self.orig_iat = dictionary["orig_iat"] as? Int
        self.user_type = dictionary["user_type"] as? String
        self.employer_id = dictionary["employer_id"] as? Int
        self.balance = dictionary["balance"] as? Double
        self.picture = dictionary["picture"] as? String
        self.status = dictionary["status"] as? String
        self.display_name = dictionary["display_name"] as? String
        self.favorite_freelancers = dictionary["favorite_freelancers"] as? [String]
        self.atibiUserType = dictionary["atibiUserType"] as? [String]
        
    }
        
    }

class Jwt{
    
    static func decodeToken(token:String )->[String: Any]?{
    
        do{
      
           let tokenDictionary =  try decode(jwt: token).body
            
            return tokenDictionary
            
        }catch let error{print(error)}
        
        return nil
    }
}
