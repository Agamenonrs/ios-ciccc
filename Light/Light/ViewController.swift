//
//  ViewController.swift
//  Light
//
//  Created by Agamenon Rocha Dos Santos on 18/04/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func lightButton(_ sender: UIButton) {
        lightOn.toggle()
        updateUI()
        
    }
    
    func updateUI(){
        view.backgroundColor = lightOn ? .white : .black
    }
    
}

