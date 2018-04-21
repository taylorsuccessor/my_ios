//
//  CarService.swift
//  ureed
//
//  Created by mohammad hashom on 4/16/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import Foundation

class UserD:Decodable{
    var email:String?="sss11"
    var date_joined:String?="sss11"
    var is_staff:Bool?=false
    var is_active:Bool?=false
    var username:String?="sss11"
    var id:Int?=0
    var last_name:String?="sss11"
    var first_name:String?="sss11"
    
}
class SourceD:Decodable{
    var user:UserD?=UserD()
}
class HitsD: Decodable {
    var _source:SourceD?=SourceD()
}

class HitsD1: Decodable {
    var hits:[HitsD] = []
}
class FreelancerResult:Decodable{
    var took:Int?=2
    var timed_out:Bool?=false
    var hits = HitsD1()
    
}

class CarService:ApiBaseService<FreelancerResult>{

    override var moduleUrl:String {get {return "freelancer/freelancer/search/?page=1"} set{}}
  
}

protocol CarProtocol:ApiBaseProtocol {
    
}
