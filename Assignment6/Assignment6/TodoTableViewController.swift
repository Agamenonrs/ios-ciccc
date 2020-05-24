//
//  TodoTableViewController.swift
//  Assignment6
//
//  Created by Agamenon Rocha Dos Santos on 15/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController, ChangeButton {
    
    var priorities : [Priority] = []
    let circle_empty = UIImage(named: "circle-empty")
    let circle_checked = UIImage(named: "circle-checked")
    
    @IBOutlet weak var deleteItems: UIBarButtonItem!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let first = Todo(title: "First", todoDescription: "First Task", isComplete: false, priority: 0)
        let second = Todo(title: "Second", todoDescription: "Second Task", isComplete: false, priority: 1)
        let third = Todo(title: "Third", todoDescription: "First Task", isComplete: false,priority: 2)
        */
        let high = Priority(id: 0, name: "High Priority", todoItems: [])
        let medium = Priority(id: 1, name: "Medium Priority", todoItems: [])
        let low = Priority(id: 2, name: "Low Priority", todoItems: [])
        priorities =  [high,medium,low]
 

    }
    
    
    @IBAction func deleteAction(_ sender: UIBarButtonItem) {
       
        for priority in priorities {
            for todo in priority.todoItems{
                if todo.checked{
                    priorities[todo.indexPath.section].todoItems.remove(at: todo.indexPath.row)
                    let indexPath = IndexPath(row: todo.indexPath.row, section: todo.indexPath.section)
                    self.tableView.deleteRows(at: [indexPath], with: . automatic)
                }
            }
        }
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return priorities.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return priorities[section].name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priorities[section].todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt
    fromIndexPath: IndexPath, to: IndexPath) {

        var todo = priorities[fromIndexPath.section].todoItems.remove(at: fromIndexPath.row)
        let customIndexPath = CustomIndexPath(row: to.row, section: to.section)
        todo.indexPath = customIndexPath
        priorities[to.section].todoItems.insert(todo, at: to.row)
        print("source size \(priorities[fromIndexPath.section].todoItems.count)")
        print("target size \(priorities[to.section].todoItems.count)")
 
        //tableView.reloadData()
        
    }
    
    @IBAction func unwindToTodoItemsTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSave" else {return }
        guard let sourceViewController = segue.source as? AddTodoItemTableViewController else {return }
        guard var todo = sourceViewController.todo else{ return }
        let selectedIndexPath = IndexPath(row: todo.indexPath.row,
        section: todo.indexPath.section)
        print(todo.indexPath)
        if selectedIndexPath.row  > -1
        {
            priorities[selectedIndexPath.section].todoItems[selectedIndexPath.row] = todo
                tableView.reloadRows(at: [selectedIndexPath],
                with: .none)
        }else {
                let x = IndexPath(row: priorities[1].todoItems.count,
                section: 1)
            let customIndex = CustomIndexPath(row: x.row, section: x.section)
            todo.indexPath = customIndex
            priorities[x.section].todoItems.append(todo)
            self.tableView.insertRows(at: [x],
                with: .automatic)
        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        print("Editing")
        
        let navController = segue.destination as!UINavigationController
        let addTodoItemTableViewController = navController.topViewController as!AddTodoItemTableViewController
        
        if segue.identifier == "editSegue" {
            let indexPath: IndexPath = sender as! IndexPath
            let todo = priorities[indexPath.section].todoItems[indexPath.row]
            addTodoItemTableViewController.todo = todo
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemsCell", for: indexPath) as! TodoItemsTableViewCell
        let customIndexPath = CustomIndexPath(row: indexPath.row, section: indexPath.section)
        let prioritie = priorities[indexPath.section]
        var todo = prioritie.todoItems[indexPath.row]
        todo.indexPath = customIndexPath

        cell.update(todo: todo)
        if todo.checked {
            cell.checkboxButton.setBackgroundImage(circle_checked, for: .normal)
        }else{
            cell.checkboxButton.setBackgroundImage(circle_empty, for: .normal)
        }
        if !tableView.isEditing {
            cell.checkboxButton.isHidden = true
        }else{
            cell.checkboxButton.isHidden = false
        }
        
        cell.showsReorderControl = true
        cell.accessoryType = .detailDisclosureButton
        
        cell.delegate = self
        cell.todoItems = prioritie.todoItems
        cell.indexPath = customIndexPath
        return cell
        
    }
    
    func changeButton(check: Bool, indexPath: CustomIndexPath) {
        priorities[indexPath.section].todoItems[indexPath.row].checked = check
        self.tableView.reloadData()
    }
    //accessory button taped
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Accessory tapped \(indexPath) acessoryButton \("tableView")" )
        self.performSegue(withIdentifier: "editSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt
    indexPath: IndexPath) {
        print("didSelectRowAt selected")
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
        tableView.reloadData()
        print("Editing mode")
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
  
}
