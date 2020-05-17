//
//  TodoItemsTableViewCell.swift
//  Assignment6
//
//  Created by Agamenon Rocha Dos Santos on 16/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class TodoItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var todoTileLabel: UILabel!
    @IBOutlet weak var todoDescriptionLabel: UILabel!
    
    func update(todo : Todo){
        todoTileLabel.text = todo.title
        todoDescriptionLabel.text = todo.todoDescription
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
