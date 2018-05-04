//
//  CarCreateView.swift
//  ureed
//
//  Created by mohammad hashom on 4/17/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import UIKit

class CarEditView: BaseEditView ,CarProtocol{

    @IBOutlet weak var titleInput: UITextField!
    
    
    @IBAction func saveButtonClick(_ sender: Any) {
        
        let params=["title":self.titleInput.text]
        if self.id > 0 {
            let url = self.service.moduleUrl + String(self.id)+"/"
        self.service.request(url:url,params:params,method:.put ,decodable:CarModel.self);
        }else{
            
            self.service.request( params:params,method:.post ,decodable:CarModel.self);
            
        }
        }
    
    func put(_ data: Any) {

        print("message success edit ")
    }
  
    
    func post(_ data: Any) {

        print("message success create ")
    }
    
    var service = CarService()
    
    func create(_ result:Any){
        print(result)
    }
    
  

    @IBOutlet weak var inputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleInput.text = String(self.id)
        
        
        self.service.delegate = self
        let url = self.service.moduleUrl + String(self.id)+"/"
        self.service.request(url:url,params:["dumy":"dumy"] ,decodable:CarModel.self);
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

     func get(_ data: Any) {
        let data=data as? CarModel
        
        self.titleInput.text = data?.title
    }
    
    
    func errorDecode(_ data: NSDictionary?) {
        print(data)
    }
}
