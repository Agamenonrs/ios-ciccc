//
//  YellowViewController.swift
//  LifeCycle
//
//  Created by Agamenon Rocha Dos Santos on 04/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("YellowViewController \(#function)")
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("YellowViewController \(#function)")
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("YellowViewController \(#function)")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("YellowViewController \(#function)")
        super.viewDidDisappear(animated)
    }
    

}
