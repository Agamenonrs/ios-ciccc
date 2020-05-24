//
//  Next2ViewController.swift
//  LayoutGuidesTest
//
//  Created by Agamenon Rocha Dos Santos on 23/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class Next2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. Instantiate 3 buttons, set their titles and set
        // translatesAutoresizingMaskIntoConstraints property to false.
        // Also add them to the superview.
        let saveButton = UIButton(type: .roundedRect)
        saveButton.setTitle("Save", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(saveButton)
        
        let revertButton = UIButton(type: .roundedRect)
        revertButton.setTitle("Revert", for: .normal)
        revertButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(revertButton)
        
        let cancelButton = UIButton(type: .roundedRect)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cancelButton)
        
        // 2. Instantiate a UILayoutGuide object and give it an
        // identifier. An identifier here is just for the sake of distinguishing
        // the layout guide as there can be multiple instances of them added in
        // a view.
        // Note: 'UI' prefix in identifier is fixed for guides created by UIKit.
        let layoutGuide = UILayoutGuide()
        layoutGuide.identifier = "group-buttons"
        
        // 2. Add the guide to the view just like we add a subview
        // to its parent view.
        self.view.addLayoutGuide(layoutGuide)
        
        // 3. Center the guide horizontally to so that the buttons are at the center of the view.
        layoutGuide.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // 4. Align the guide with the bottom layout guide of the viewcontroller. A -20
        // constant keeps it 20px above.
       // layoutGuide.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        layoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        // 4. Bind the top, leading and trailing anchors of button with the layoutGuide object.
        saveButton.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        
        // 5. Bind the top anchor with the bottom anchor of the above button with a constant
        // of 20px to keep the spacing among the buttons.
        revertButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20.0).isActive = true
        
        // 6. Bind leading and trailing anchors with the layoutGuide object.
        revertButton.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        revertButton.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        
        // 7. Similar to step 5, bind the top anchor with bottom anchor of the above button.
        cancelButton.topAnchor.constraint(equalTo: revertButton.bottomAnchor, constant: 20.0).isActive = true
        
        // 8. Bind leading and trailing anchors with the layoutGuide object.
        cancelButton.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        
        // 9. Finally bind the bottom anchor of last button with the bottom anchor of
        // the layoutGuide object to give the layoutGuide a height.
        cancelButton.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        
    }
   
}
