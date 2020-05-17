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
        
        let high = Priority(id: 0, name: "High Priority", todoItems: [first])
        let medium = Priority(id: 1, name: "Medium Priority", todoItems: [second])
        let low = Priority(id: 2, name: "Low Priority", todoItems: [third])
        
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
        return priorities[section].todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt
    fromIndexPath: IndexPath, to: IndexPath) {
       
        let todo = priorities[fromIndexPath.section].todoItems.remove(at: fromIndexPath.row)
        //priorities[to.section].todoItems.insert(todo, at: to.row)
        priorities[to.section].todoItems.append(todo)
        print("source size \(priorities[fromIndexPath.section].todoItems.count)")
        print("target size \(priorities[to.section].todoItems.count)")
 
        tableView.reloadData()
        
    }
    
    @IBAction func unwindToTodoItemsTableView(segue: UIStoryboardSegue) {
        print("==== unwind ======")
        guard segue.identifier == "unwindSave" else {return }
        print("==== segue is ok ======")
        guard let sourceViewController = segue.source as? AddTodoItemTableViewController else {return }
        print("==== sourceViewController is ok ======")
        guard let todo = sourceViewController.todo else{ return }
        
        print("==== todo is ok ======")
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
                /*
                priorities[selectedIndexPath.row] = emoji
                tableView.reloadRows(at: [selectedIndexPath],
                with: .none)
                 */
        } else {
                
            let newIndexPath = IndexPath(row: priorities[1].todoItems.count,
                section: 1)
            print(priorities[newIndexPath.section])
            print(priorities[newIndexPath.section].todoItems)
            var items = priorities[newIndexPath.section].todoItems
            items.append(todo)
            for t in items{
                print("Item \(t.title)" )
            }
            print(items.count)
            //items.append(todo)
            
             
            priorities[newIndexPath.section].todoItems = items
            priorities[newIndexPath.section].todoItems.append(todo)
            print(priorities[newIndexPath.section].todoItems.count)
            print("section \(newIndexPath.section)")
            for t in priorities[newIndexPath.section].todoItems{
                print("Item \(t.title)" )
            }
            //self.tableView.reloadData()
            //self.tableView.beginUpdates()
            //self.tableView.insertRows(at: [newIndexPath],with: .automatic)
            //self.tableView.endUpdates()
                
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        print("Editing")
        /*
        if segue.identifier == "EditEmoji" {
           
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let navController = segue.destination as!
               UINavigationController
            let addEditEmojiTableViewController =
               navController.topViewController as!
               AddEditEmojiTableViewController
     
            addEditEmojiTableViewController.emoji = emoji
 
        }
 */
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemsCell", for: indexPath) as! TodoItemsTableViewCell
        
        let prioritie = priorities[indexPath.section]
        let todo = prioritie.todoItems[indexPath.row]

        
        cell.update(todo: todo)
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
