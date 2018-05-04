//
//  ViewController.swift
//  ureed
//
//  Created by mohammad hashom on 4/7/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import UIKit
import Alamofire



class CarListView: BaseListView,UITableViewDataSource,UITableViewDelegate,CarProtocol{
    
    
    @IBAction func createButtonClick(_ sender: Any) {
        self.id = 0
        self.performSegue(withIdentifier:"editSegue", sender:self)
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var test: UILabel!
    var service = CarService()
    
    var dataArray:CarListDecodable?
    var filterData:[String: Any]=["p":1,"o":"id","per_page":2]
    var id: Int = 0
        
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


    override func performEditView(_ id: Int){
        self.id = id
        self.performSegue(withIdentifier:"editSegue", sender:self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editSegue"){
            let editView = segue.destination as? BaseEditView
            editView?.id=self.id
        }
    }
    
}


extension CarListView{
    
    
    
    
    func get(_ data: Any) {
        
        let dataList = data as? CarListDecodable
        
        if self.dataArray != nil{
            self.dataArray?.results?.append(contentsOf:(dataList?.results)!)
        }else{
            self.dataArray = dataList
        }
       self.tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as! TableViewCell
        cell.id=(self.dataArray?.results?[indexPath.row].id)!
        cell.parentViewController=self
        cell.label.text=self.dataArray?.results?[indexPath.row].title
        cell.cellButton.setTitle( String(describing: self.dataArray?.results?[indexPath.row].id), for: .normal )
        return cell
    }
   
    func tableView(_ tableView: UITableView, willDisplay cell :UITableViewCell,forRowAt indexPath:IndexPath) {
        if indexPath.row == ((self.dataArray?.results?.count)! - 1) {
            self.filterData["p"] =  (self.filterData["p"] as? Int)! + 1
            self.service.request( params: self.filterData,decodable:CarListDecodable.self);
        }
        
    }
    
    
}

