//
//  OffersCell.swift
//  Offer_alamo2
//
//  Created by JIJO G OOMMEN on 20/06/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit

class OffersCell: UITableViewCell {

    @IBOutlet weak var imageoutlet: UIImageView!
    @IBOutlet weak var amountoutlet: UILabel!
    @IBOutlet weak var stoplabel: UILabel!
    @IBOutlet weak var startlabel: UILabel!
    @IBOutlet weak var informationlabel: UILabel!
    @IBOutlet weak var detailsoutlet: UILabel!
    @IBOutlet weak var nameoutlet: UILabel!
    @IBOutlet weak var idoutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
