//
//  StudentsTableViewController.swift
//  EmojiDictionary
//
//  Created by Agamenon Rocha Dos Santos on 12/05/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {

    var students = [
        "Student1", "Student2","Student3","Student4","Student5"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Students list"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StudentCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }

  

}
