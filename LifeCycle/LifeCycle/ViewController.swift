//
//  ViewController.swift
//  LifeCycle
//
//  Created by Agamenon Rocha Dos Santos on 04/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        print("ViewController \(#function)")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewController \(#function)")
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewController \(#function)")
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewController \(#function)")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewController \(#function)")
        super.viewDidDisappear(animated)
    }


}

