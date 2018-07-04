//
//  ProfileComunitiesTableViewCell.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 7/4/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class ProfileComunitiesTableViewCell: UITableViewCell {
    @IBOutlet weak var startupName: UILabel!
    @IBOutlet weak var numberOfQuestions: UILabel!
    @IBOutlet weak var numberOfMembers: UILabel!
    @IBOutlet weak var comunitiesImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
