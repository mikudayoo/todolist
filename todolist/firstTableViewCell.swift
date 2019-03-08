//
//  firstTableViewCell.swift
//  todolist
//
//  Created by 横尾美空 on 2019/02/08.
//  Copyright © 2019年 横尾美空. All rights reserved.
//

import UIKit

class firstTableViewCell: UITableViewCell {
    
    @IBOutlet var dayLabel : UILabel!
    @IBOutlet var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
