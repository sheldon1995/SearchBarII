//
//  TableCell.swift
//  SearchBarInTable
//
//  Created by Sheldon on 12/31/19.
//  Copyright © 2019 wentao. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {


   
    @IBOutlet weak var NameLab: UILabel!
    @IBOutlet weak var CategoryLab: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
