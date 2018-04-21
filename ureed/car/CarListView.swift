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
    
    var dataArray=FreelancerResult()
    var filterData:[String: Any]=["page":1]
        
        
    @IBOutlet weak var labelOutlet: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate=self
        tableView.dataSource=self
        
        
   
        
        self.service.delegate = self
        self.service.getList( params: self.filterData);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension CarListView{
    
    
    
    
    func getList(_ data: Any) {
        
        self.dataArray=(data as? FreelancerResult)!
        self.tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.hits.hits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as! TableViewCell
        cell.label.text=self.dataArray.hits.hits[indexPath.row]._source?.user?.last_name ?? ""
        return cell
    }
    
    
    
}

