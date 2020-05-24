//
//  Next1ViewController.swift
//  LayoutGuidesTest
//
//  Created by Agamenon Rocha Dos Santos on 22/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class Next1ViewController: UIViewController {

    override func viewDidLoad() {
        // 1. Instantiate the UILayoutGuide instance and give it an identifier
              // Note: 'UI' prefix in identifier is fixed for guides created by UIKit.
              let guide = UILayoutGuide()
              guide.identifier = "layoutguide"
              
              // 2. Add the guide to the view just like we add a subview
              // to its parent view.
              self.view.addLayoutGuide(guide)
              
              // 3. Give layoutguide a width of 30px. So that two views will be
              // separated by a distance of 30px.
              guide.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
              
              // 4. Center the guide vertically and horizontally at the center of the view.
              guide.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
              guide.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

              // 5. Instantiate two views, red and green and add them to the superview.
              let redView = UIView()
              redView.backgroundColor = UIColor.red
              redView.translatesAutoresizingMaskIntoConstraints = false
              self.view.addSubview(redView)
              
              let greenView = UIView()
              greenView.backgroundColor = .green
              greenView.translatesAutoresizingMaskIntoConstraints = false
              self.view.addSubview(greenView)
              
              // 6. Give height and width explicitly to the views.
              redView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
              redView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true

              greenView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
              greenView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true

              
              // 7. Center the views with the layout guide.
              redView.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
              greenView.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
              
              // 8.1 Bind the green view at the left side of the guide.
              greenView.trailingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
              
              // 8.2 Another way of doing the same thing. Un comment this one and comment out the above
              // line.
              // guide.leadingAnchor.constraint(equalTo: greenView.trailingAnchor).isActive = true
              
              // 9.1 Bind the red view at the right side of the guide
              redView.leadingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
              
              // 9.2 Another way of doing the same thing. Un comment this one and comment out the
              // above line.
              // guide.trailingAnchor.constraint(equalTo: redView.leadingAnchor).isActive = true
    }
    

   

}
