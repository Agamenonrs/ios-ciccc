//
//  AddTodoItemTableViewController.swift
//  Assignment6
//
//  Created by Agamenon Rocha Dos Santos on 16/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class AddTodoItemTableViewController: UITableViewController {
    
    @IBOutlet weak var todoTitleTextField: UITextField!
    
    @IBOutlet weak var todoDescriptionTextField: UITextField!
    
    var todo : Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = todo {
            print("viewDidLoad \(todo.indexPath)")
            todoTitleTextField.text = todo.title
            todoDescriptionTextField.text = todo.todoDescription
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        print("prepare save")
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "unwindSave" else { return }
        let title = todoTitleTextField.text ?? ""
        let todoDescription = todoDescriptionTextField.text ?? ""
        let customIndexPath = todo?.indexPath
        todo = Todo(title: title, todoDescription: todoDescription, isComplete: false, priority: 1)
        todo?.indexPath = customIndexPath ?? CustomIndexPath(row: -1, section: -1)
        print("prepare save endS")
    }

}
