//
//  todoCell.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-18.
//

import UIKit

class todoCell: UITableViewCell {

    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var todoImage: UIImageView!
    var isChecked = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
