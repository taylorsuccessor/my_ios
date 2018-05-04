//
//  CarService.swift
//  ureed
//
//  Created by mohammad hashom on 4/16/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import Foundation


struct CarModel: Decodable {
    let id : Int
    var title : String?
}
class CarListDecodable : Decodable {
    let count : Int
    let next : String?
    let previous : String?
    var results : [CarModel]?
    
}

class CarService:ApiBaseService {
    override var moduleUrl:String {get {return "article/api/"} set{}}
}

protocol CarProtocol:ApiBaseProtocol {
    
}
