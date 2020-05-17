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
    var todo : Todo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = todo {
            todoTitleTextField.text = todo.title
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        print("prepare save")
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "unwindSave" else { return }
        let title = todoTitleTextField.text ?? ""
        todo = Todo(title: title, todoDescription: "Teste", isComplete: false, priority: 1)
        print("prepare save endS")
    }

}
