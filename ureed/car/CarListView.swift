//
//  ViewController.swift
//  ureed
//
//  Created by mohammad hashom on 4/7/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import UIKit
import Alamofire



class CarListView: UIViewController,UITableViewDataSource,UITableViewDelegate,CarProtocol{
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var test: UILabel!
    var service = CarService()
    
    var dataArray:CarListDecodable?
    var filterData:[String: Any]=["page":3]
        
        
    @IBOutlet weak var labelOutlet: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate=self
        tableView.dataSource=self
        
        
        self.service.delegate = self
        self.service.request( params: self.filterData,decodable:CarListDecodable.self);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension CarListView{
    
    
    
    
    func get(_ data: Any) {
        
        self.dataArray = data as? CarListDecodable
       
         self.tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as! TableViewCell
        cell.label.text=self.dataArray?.results?[indexPath.row].title 
        return cell
    }
   
    func tableView(_ tableView: UITableView, willDisplay cell :UITableViewCell,forRowAt indexPath:IndexPath) {
        if indexPath.row == ((self.dataArray?.results?.count)! - 1) {
            print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            self.filterData["page"] =  (self.filterData["page"] as? Int)! + 1
            print(self.filterData["page"])
            self.service.request( params: self.filterData,decodable:CarListDecodable.self);
        }
    }
    
    
    
}

