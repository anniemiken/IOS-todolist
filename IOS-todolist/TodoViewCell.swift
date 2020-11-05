//
//  TodoViewCell.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-05.
//

import UIKit

class TodoViewCell: UITableViewCell {

    @IBOutlet weak var listNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
