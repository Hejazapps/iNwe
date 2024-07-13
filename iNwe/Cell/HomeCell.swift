//
//  HomeCell.swift
//  iNwe
//
//  Created by Sadiqul Amin on 12/7/24.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var widthForImv: NSLayoutConstraint!
    @IBOutlet weak var holder: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imv: UIImageView!
    
    @IBOutlet weak var searchImv: UIImageView!
    @IBOutlet weak var resetImv: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
