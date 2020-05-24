//
//  ViewController.swift
//  LayoutGuidesTest
//
//  Created by Agamenon Rocha Dos Santos on 22/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var viewToAnimate: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let space1 = UILayoutGuide()
        view.addLayoutGuide(space1)
        
        let space2 = UILayoutGuide()
        view.addLayoutGuide(space2)
        saveButton.backgroundColor = .blue
        
        space1.widthAnchor.constraint(equalTo: space2.widthAnchor).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: space1.leadingAnchor).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: space1.leadingAnchor).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: space2.leadingAnchor).isActive = true
        clearButton.leadingAnchor.constraint(equalTo: space2.trailingAnchor).isActive = true

        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.viewToAnimate.alpha = 0
        }) { _ in
            self.viewToAnimate.removeFromSuperview()
        }
        
    }


}

