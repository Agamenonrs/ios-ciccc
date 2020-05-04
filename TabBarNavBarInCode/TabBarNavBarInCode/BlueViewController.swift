//
//  BlueViewController.swift
//  TabBarNavBarInCode
//
//  Created by Agamenon Rocha Dos Santos on 02/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    let centerButton : UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.setTitle("Go to yellow", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.backgroundColor = .lightGray
        btn.layer.cornerRadius = 16
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Blue"
        
        view.addSubview(centerButton)
        centerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        centerButton.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.1).isActive = true
        centerButton.addTarget(self, action: #selector(goToYellowController), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func goToYellowController(_ sender : UIButton){
        let yellowVC = YellowViewController()
        navigationController?.pushViewController(yellowVC,animated: true)
    }
    
}
