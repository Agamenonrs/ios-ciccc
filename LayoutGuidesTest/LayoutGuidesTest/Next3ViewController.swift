//
//  Next3ViewController.swift
//  LayoutGuidesTest
//
//  Created by Agamenon Rocha Dos Santos on 23/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class Next3ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var startAnimation: UIButton!
    
    var labelPositionisLeft = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func startAnimationAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            if self.labelPositionisLeft {
                self.label.center.x = self.view.bounds.width - 100
            }
            else {
                self.label.center.x = 100
            }
            self.labelPositionisLeft = !(self.labelPositionisLeft)
        }, completion: nil)
    }
}
