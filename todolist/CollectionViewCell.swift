//
//  CollectionViewCell.swift
//  todolist
//
//  Created by 横尾美空 on 2019/02/22.
//  Copyright © 2019年 横尾美空. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var checkedLabel: UILabel!
    @IBOutlet var uncheckedLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // cellの枠の太さ
        self.layer.borderWidth = 1.0
        // cellの枠の色
        self.layer.borderColor = UIColor.black.cgColor
        // cellを丸くする
        self.layer.cornerRadius = 8.0
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
