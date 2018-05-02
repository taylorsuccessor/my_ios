//
//  ApiBaseProtocol.swift
//  ureed
//
//  Created by mohammad hashom on 4/17/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import Foundation

protocol ApiBaseProtocol {
    func get(_ data: Any)
    func post(_ data: Any)
    func getList(_ data: Any)
    func getOne(_ data: Any)
    func postDecode(_ data: Any)
    
    func options(_ data: Any)
    func head(_ data: Any)
    func put(_ data: Any)
    func patch(_ data: Any)
    func delete(_ data: Any)
    func trace(_ data: Any)
    func connect(_ data: Any)
    
    func errorDecode(_ data: NSDictionary?)
    
}

extension ApiBaseProtocol{
    func get(_ data: Any){print("get default protocol function called ApiBaseProtocol");}
    func post(_ data: Any){print("post default protocol function called ApiBaseProtocol");}
    func getList(_ data: Any){print("getList default protocol function called ApiBaseProtocol");}
    func getOne(_ data: Any){print("getOne default protocol function called ApiBaseProtocol");}
    func postDecode(_ data: Any){print("postDecode default protocol function called ApiBaseProtocol");}
    func options(_ data: Any){print("options default protocol function called ApiBaseProtocol");}
    func head(_ data: Any){print("head default protocol function called ApiBaseProtocol");}
    func put(_ data: Any){print("put default protocol function called ApiBaseProtocol");}
    func patch(_ data: Any){print("patch default protocol function called ApiBaseProtocol");}
    func delete(_ data: Any){print("delete default protocol function called ApiBaseProtocol");}
    func trace(_ data: Any){print("trace default protocol function called ApiBaseProtocol");}
    func connect(_ data: Any){print("connect default protocol function called ApiBaseProtocol");}
    func errorDecode(_ data: NSDictionary?){print("errorDecode default protocol function called ApiBaseProtocol");}
    
    
}

