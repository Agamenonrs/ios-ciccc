//
//  TodoItemsTableViewCell.swift
//  Assignment6
//
//  Created by Agamenon Rocha Dos Santos on 16/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

protocol ChangeButton {
    func changeButton(check : Bool, indexPath: CustomIndexPath)
}

class TodoItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var todoTileLabel: UILabel!
    @IBOutlet weak var todoDescriptionLabel: UILabel!
    
    @IBOutlet weak var checkboxButton: UIButton!
    
    var delegate : ChangeButton?
    var indexPath : CustomIndexPath?
    var todoItems : [Todo]?
    
    func update(todo : Todo){
        todoTileLabel.text = todo.title
        todoDescriptionLabel.text = todo.todoDescription
    }

    @IBAction func checboxAction(_ sender: UIButton) {
        if todoItems![indexPath!.row].checked {
            delegate?.changeButton(check: false, indexPath: indexPath!)
        }else{
            delegate?.changeButton(check: true, indexPath: indexPath!)
        }
    }
}
