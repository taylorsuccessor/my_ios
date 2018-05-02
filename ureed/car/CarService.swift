//
//  CarService.swift
//  ureed
//
//  Created by mohammad hashom on 4/16/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import Foundation


struct UserAlias : Decodable {
    let id : Int = 0
    let username : String?=""
    let email : String?=""
    let first_name : String?=""
    let last_name : String?=""
}
struct CarModel: Decodable {
    let id : Int
    let owner_alias : UserAlias? = UserAlias()
    let assign_to_alias : UserAlias? = UserAlias()
    let editor_alias : UserAlias? = UserAlias()
    let title : String?
    let headlines : String?
    let links : String?
    let keywordswords : String?
    let description : String?
    let admin_note : String?
    let editor_note : String?
    let body : String?
    let status : String?
    let created_on : String?
    let edited_on : String?
    let submitted_on : String?
    let completed_on : String?
    let owner : Int? = 0
    let assign_to : Int? = 0
    let editor : Int? = 0
    let file_group : Int?
    let category : [Int]?
}
class CarListDecodable : Decodable {
    let count : Int
    let next : String?
    let previous : String?
    var results : [CarModel]?
    
}

class CarService:ApiBaseService {
// http://api.beta.ureed.net/job/job/get_my_jobs/?status=AC&page=1
    //"article/api/?page=1"
    override var moduleUrl:String {get {return "job/job/get_my_jobs/"} set{}}
  
}

protocol CarProtocol:ApiBaseProtocol {
    
}
