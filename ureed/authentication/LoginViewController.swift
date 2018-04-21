//
//  ViewController.swift
//  ureed
//
//  Created by mohammad hashom on 4/7/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

struct SubJson:Decodable{
    var name:String?
}
struct JsonParase:Decodable{
    var canonical_name :String?
    var subname:[SubJson]
    
}
import UIKit
import Alamofire
import FontAwesome_swift

class LoginViewController: UIViewController{

    var token:String=""
 
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var xxx: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBAction func loginClick(_ sender: Any) {
 
    
        let param = [
            "username": usernameInput.text!, //email
            "password": passwordInput .text! //password
        ]
        Alamofire.request(ApiSetting.API_URL + "api-token-auth/",  method: .post,parameters: param , encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                   print(response.result)
            switch response.result {
            case .success(let JSON):
                print("Success with JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
                
                //example if there is an id
                let tokenResult = response.object(forKey: "token")
                
                if tokenResult != nil {
                    
                    self.token=tokenResult as! String
                    self.performSegue(withIdentifier: "loginSuccessSegue", sender: self)
                }
                
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
                }
        }
        
        
        
        
        
        
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let nextControllor=segue.destination as! ListController
        if token != "" {
            
            User.token=token
            User.setUserData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.font = UIFont.fontAwesome(ofSize: 18)
        self.label.text = String.fontAwesomeIcon(name: .github)
     //self.label.text=String(format: "%C",0xf368)
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

