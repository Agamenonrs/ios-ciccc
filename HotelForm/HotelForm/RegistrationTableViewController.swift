//
//  RegistrationTableViewController.swift
//  HotelForm
//
//  Created by Agamenon Rocha Dos Santos on 19/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Registrations"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRegistration(_:)))

    }
    
//    private func addNew(registration: Registration) {
//      registrations.append(registration)
//      tableView.insertRows(at: [IndexPath(row: registrations.count - 1, section: 0)], with: .automatic)
//    }
    
    @objc func addRegistration(_ sender : UIBarButtonItem){
        print("Add Button")
        let addRegistrationVC = AddRegistrationTableViewController(style: .grouped)
        let embedNav = UINavigationController(rootViewController: addRegistrationVC)
        //addVC.addRegistration = addNew
        present(embedNav, animated: true, completion: nil)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    

}
