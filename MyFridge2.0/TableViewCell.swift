//
//  TableViewCell.swift
//  MyFridge2.0
//
//  Created by Husban Ahmed on 1/24/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet var mylabel: UILabel!
    
    @IBOutlet var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
}
