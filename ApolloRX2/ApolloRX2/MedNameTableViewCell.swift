//
//  MedNameTableViewCell.swift
//  ApolloRX2
//
//  Created by Nubia Johnson on 4/15/22.
//

import UIKit

class MedNameTableViewCell: UITableViewCell {

    @IBOutlet weak var regularNameLabel: UILabel!
    @IBOutlet weak var dosageFormLabel: UILabel!
    @IBOutlet weak var routeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
