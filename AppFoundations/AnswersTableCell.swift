//
//  AnswersTableCell.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/25/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class AnswersTableCell: UITableViewCell {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    var id = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func Scorizador(_ sender: UIStepper) {
        score.text = String(Int(sender.value))
 //       Answers.getById(id: id).attScore(Int(sender.value))      Irá ser modificado pra guardar na struct
    }
}
