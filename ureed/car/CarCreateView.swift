//
//  CarCreateView.swift
//  ureed
//
//  Created by mohammad hashom on 4/17/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import UIKit

class CarCreateView: UIViewController ,CarProtocol{
    func getList(_ z: FreelancerResult) {
        
    }
    
 
    func create(_ result:Any){
        print(result)
    }
    
  

    @IBOutlet weak var inputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
