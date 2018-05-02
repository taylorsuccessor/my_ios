//
//  User.swift
//  ureed
//
//  Created by mohammad hashom on 4/16/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import Foundation

class User{
    public static var token:String=""
    
    public static var userData:[String: Any]=[
    "user_id":0,
    "email":"",
    "username" :"",
    "exp":0,
    "is_remember_me":false,
    "orig_iat": 0,
    "user_type" : "",
    "employer_id":0,
    "balance": 0,
    "picture":"",
    "status" : "",
    "display_name" : "",
    "favorite_freelancers" : [""],
    "atibiUserType" : [""],
    ]
    
    static func setUserData(_ token:String){
      
        User.token=token
        User.userData=Jwt.decodeToken(token: User.token)!
      
    }
}
