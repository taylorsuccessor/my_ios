//
//  TableViewCell.swift
//  ureed
//
//  Created by mohammad hashom on 4/7/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cielView: UIView!
    @IBOutlet weak var label: UILabel!
      var parentViewController:BaseListView!
    @IBOutlet weak var cellButton: UIButton!
    var id:Int = 0
    

   
    
    @IBAction func cleckCellButton(_ sender: Any) {
        // nextTest
        self.parentViewController.performEditView(self.id)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
