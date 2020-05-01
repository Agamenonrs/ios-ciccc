//
//  ViewController.swift
//  Login
//
//  Created by Agamenon Rocha Dos Santos on 30/04/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var username : UITextField!
    @IBOutlet var password : UITextField!
    
    @IBOutlet var forgottenUsernameButton : UIButton!
    @IBOutlet var forgottenPasswordButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*guard let sender = sender as? UIButton else {return}
         
        if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUsernameButton {
         */

        
        guard let sender = sender  as?  UIButton else { return }
        if sender == forgottenPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        }else if sender == forgottenUsernameButton{
            segue.destination.navigationItem.title = "Forgot Username"
        }else{
            segue.destination.navigationItem.title = username.text
        }
        
    }
    
    
    @IBAction func recoverUsername(_ sender: UIButton) {
        performSegue(withIdentifier: "notButtonSegue", sender: forgottenUsernameButton)
    }
    
    @IBAction func recoverPassword(_ sender: UIButton) {
        performSegue(withIdentifier: "notButtonSegue", sender: forgottenPasswordButton)
    }
    
}

