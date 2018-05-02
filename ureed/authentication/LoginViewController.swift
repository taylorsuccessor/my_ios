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
        self.service.request(url:self.service.moduleUrl , params: param,method:.post ,decodable:LoginSuccessResult.self)
       
    
        let storyboard = UIStoryboard(name: "Layout", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Layout.SideMenuView")
        self.present(controller, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service.delegate = self
        
        
        
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
