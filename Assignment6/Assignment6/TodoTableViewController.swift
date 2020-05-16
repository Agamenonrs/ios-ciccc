//
//  TodoTableViewController.swift
//  Assignment6
//
//  Created by Agamenon Rocha Dos Santos on 15/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    
    
    var priorities : [Priority] {
        
        let first = Todo(title: "First", todoDescription: "First Task", isComplete: false, priority: 0)
        let second = Todo(title: "Second", todoDescription: "Second Task", isComplete: false, priority: 1)
        let third = Todo(title: "Third", todoDescription: "First Task", isComplete: false,priority: 2)
        
        var high = Priority(id: 0, name: "High Priority", todoItems: [first])
        var medium = Priority(id: 1, name: "Medium Priority", todoItems: [second])
        var low = Priority(id: 2, name: "Low Priority", todoItems: [third])
        
        return [high,medium,low]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return priorities.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return priorities[section].name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return priorities[section].todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt
    fromIndexPath: IndexPath, to: IndexPath) {
       
        let todo = priorities[fromIndexPath.section].todoItems.remove(at: fromIndexPath.row)
        //priorities[to.section].todoItems.insert(todo, at: to.row)
        priorities[to.section].todoItems.append(todo)
        print("target size \(priorities[fromIndexPath.section].todoItems.count)")
        print("target size \(priorities[to.section].todoItems.count)")
 
        tableView.reloadData()
        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemsCell", for: indexPath)
        
        let prioritie = priorities[indexPath.section]
        let todo = prioritie.todoItems[indexPath.row]

        
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = todo.todoDescription
        cell.showsReorderControl = true
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt
    indexPath: IndexPath) {
        print("didSelectRowAt selected")
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
        print("Editing mode")
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    

//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        print("Editing mode")
//        return true
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
