//
//  ViewController.swift
//  ureed
//
//  Created by mohammad hashom on 4/7/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import UIKit
import Alamofire
import FontAwesome_swift

class LoginViewController: UIViewController{
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    var service = AuthenticationService()
    
    
    
    @IBAction func loginClick(_ sender: Any) {
        let param = [
            "username": usernameInput.text!,
            "password": passwordInput .text!
        ]
        self.service.request( params: param,method:.post ,decodable:LoginSuccessResult.self)
       
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service.delegate = self
        
        self.tryLogin()
        
    }
    
    @IBAction func clickc(_ sender: Any) {
        self.tryLogin()
        print(1)
    }
    
    func tryLogin(){
        print(2)
        let params = ["id":"3001","title":"tttttt ","is_premium":true,"delivery_time":"2018-06-26 02:04:00","skills": [
        [
            "id": 15
            ],
        [
            "id": 16
            ],
        [
            "id": 11
            ],
        [
            "id": 9
            ]
            ]] as [String : Any]
        let headerss = [
         
            "Authorization": "JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo4OTksInVzZXJuYW1lIjoibW9oYW1tYWQxNiIsImRpc3BsYXlfbmFtZSI6IlVyZWVkIFByb2plY3RzIERlcGFydG1lbnQiLCJmYXZvcml0ZV9mcmVlbGFuY2VycyI6W10sImF0aWJpVXNlclR5cGUiOlsiTUEiXSwiZW1wbG95ZXJfaWQiOjE1MCwiYmFsYW5jZSI6ODY2NzYuOTksInN0YXR1cyI6IkFDIiwiZW1haWwiOiJtb2hhbW1hZC5oaXRobmF3aUB1cmVlZC5jb20iLCJvcmlnX2lhdCI6MTUzMDAxNDc3OSwidXNlcl90eXBlIjoiZW0iLCJpc19yZW1lbWJlcl9tZSI6ZmFsc2UsInBpY3R1cmUiOiJodHRwczovL21lZGlhLXN0YWdpbmctdXJlZWQuczMuYW1hem9uYXdzLmNvbS9jYWNoZS80Ny9mYi80N2ZiZDI0YzZhZmNkNGNlZWE1YzQ0M2JkNzUyYzgyMC5wbmciLCJleHAiOjE2MTYzMjgzNzl9.xRUtn3kxb-xi_5-5eJKDXTwG8MV_i3wEz1cJMliRexE"
            
        ]
        
        Alamofire.request("http://api.beta.ureed.net/job/job/3001/",  method: .put,parameters: params, encoding:JSONEncoding.default, headers: headerss).responseString { response in
            
           print(response)
        }
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
 
}

//api
extension LoginViewController:LoginProtocol{
    
    
    
    func post(_ data:Any){
        
        guard let data = data as? LoginSuccessResult   else{
            print("message : error login")
            return
        }
        
        User.setUserData(data.token)
        self.performSegue(withIdentifier: "loginSuccessSegue", sender: self)
    }
    func errorDecode(_ data: NSDictionary?) {
        
        let loginDataError = data?["non_field_errors"]
        if loginDataError != nil {
            let errorMessages = loginDataError as? NSArray
            print(errorMessages?[0])
            return
        }
        
        
        let passwordRequiredError = data?["password"]
        if passwordRequiredError != nil {
            let passwordErrorMessages = passwordRequiredError as? NSArray
            print(passwordErrorMessages?[0])
        }
        
        
        let usernameRequiredError = data?["password"]
        if usernameRequiredError != nil {
            let usernameErrorMessages = usernameRequiredError as? NSArray
            print(usernameErrorMessages?[0])
        }
        
    }
    
    
    
}
