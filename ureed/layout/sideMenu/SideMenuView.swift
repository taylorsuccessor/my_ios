//
//  SideMenu.swift
//  ureed
//
//  Created by mohammad hashom on 4/20/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import UIKit

class SideMenuView: UIViewController {

    @IBOutlet weak var userImageOutlet: UIImageView!
    @IBOutlet weak var userNameOutlet: UILabel!
    @IBOutlet weak var closeMenuButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImageOutlet.layer.masksToBounds = true
        userImageOutlet.layer.cornerRadius = 40
        
        userImageOutlet.layer.borderWidth = 2
        userImageOutlet.layer.borderColor = UIColor.brown.cgColor
        self.userNameOutlet.text=User.userData["display_name"]   as? String
        self.userImageOutlet.image=UIImage(urlString:  User.userData["picture"] as! String)
        // Do any additional setup after loading the view.
   
        
        
    //layout
        
        self.closeMenuButton.titleLabel!.font = UIFont.fontAwesome(ofSize: 18)
        self.closeMenuButton.setTitle(String.fontAwesomeIcon(name: .alignJustify), for: UIControlState.normal)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}


