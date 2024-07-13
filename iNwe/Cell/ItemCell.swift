//
//  ItemCell.swift
//  iNwe
//
//  Created by Sadiqul Amin on 10/7/24.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var imv: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
