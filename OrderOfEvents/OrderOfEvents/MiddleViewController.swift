//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Agamenon Rocha Dos Santos on 04/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var middleLabel: UILabel!
    var eventNumber : Int = 1
    
    fileprivate func logLifeCycle(method : String) {
        if let existingText = middleLabel.text{
            middleLabel.text = "\(existingText)\n event number \(eventNumber)" +
            " was \(method)"
            eventNumber += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logLifeCycle(method: #function)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logLifeCycle(method: #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logLifeCycle(method: #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        logLifeCycle(method: #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        logLifeCycle(method: #function)
    }

}
