//
//  ToDoCell.swift
//  MVCDesignPattern
//
//  Created by Administrator on 19/08/18.
//  Copyright © 2018 MyTeam. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    var cellController: ToDoCellController? {
        didSet {
            
            guard let controller = cellController else { return }
            
            textLabel?.text = controller.activity
            detailTextLabel?.text = controller.time
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
