//
//  ComunitiesTableViewCell.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 7/4/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class ComunitiesTableViewCell: UITableViewCell {
    @IBOutlet weak var comunityImage: UIImageView!
    @IBOutlet weak var comunityName: UILabel!
    @IBOutlet weak var comunityDescription: UITextView!
    @IBOutlet weak var numberOfMembers: UILabel!
    @IBOutlet weak var numberOfQuestions: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
