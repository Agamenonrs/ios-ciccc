//
//  ViewController.swift
//  Assignment7
//
//  Created by Agamenon Rocha Dos Santos on 21/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customNavBar: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var tbView: UITableView!
    
    var foods: [String] = []
    
    
    var isOpen : Bool = false
    var vStackView : UIStackView!
    
    fileprivate func getGestureRocognizer() -> UITapGestureRecognizer {
        return UITapGestureRecognizer(target: self, action:  #selector(self.imageTapped))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customNavBar.backgroundColor = .lightGray
        
        tbView.delegate = self
        tbView.dataSource = self
        //        tbView.topAnchor.constraint(equalTo: customNavBar.bottomAnchor, constant: 5).isActive = true
        let imag1 = UIImageView(image: #imageLiteral(resourceName: "ramen"))
        let imag2 = UIImageView(image: #imageLiteral(resourceName: "pizza_pockets"))
        let imag3 = UIImageView(image: #imageLiteral(resourceName: "popsicle"))
        let imag4 = UIImageView(image: #imageLiteral(resourceName: "oreos"))
        let imag5 = UIImageView(image: #imageLiteral(resourceName: "pop_tarts"))
        imag1.isUserInteractionEnabled = true
        imag2.isUserInteractionEnabled = true
        imag3.isUserInteractionEnabled = true
        imag4.isUserInteractionEnabled = true
        imag5.isUserInteractionEnabled = true
        let gesture = getGestureRocognizer()
        
        imag1.addGestureRecognizer(gesture)
        imag2.addGestureRecognizer(getGestureRocognizer())
        imag3.addGestureRecognizer(getGestureRocognizer())
        imag4.addGestureRecognizer(getGestureRocognizer())
        imag5.addGestureRecognizer(getGestureRocognizer())
        
        vStackView = UIStackView(arrangedSubviews: [imag1,imag2,imag3,imag4,imag5])
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.axis = .horizontal
        vStackView.distribution = .fillEqually
        vStackView.isHidden = true
        customNavBar.addSubview(vStackView)
        
        NSLayoutConstraint.activate([
            vStackView.centerXAnchor.constraint(equalTo: customNavBar.centerXAnchor),
            // vStackView.centerYAnchor.constraint(equalTo: customNavBar.centerYAnchor),
            vStackView.bottomAnchor.constraint(equalTo: customNavBar.bottomAnchor, constant: -20),
            vStackView.heightAnchor.constraint(equalToConstant: customNavBar.frame.height - 20),
            vStackView.widthAnchor.constraint(equalToConstant: customNavBar.frame.width)
            
        ])
        
    }
    
    @objc func imageTapped(sender : UITapGestureRecognizer){
        print("image clicked")
        let tappedImage = sender.view as! UIImageView
        foods.append(tappedImage.image!.accessibilityIdentifier!)
        // update view (table view)
        tbView.insertRows(at: [IndexPath(row: foods.count-1, section: 0)], with: .automatic)
    }
    
    @IBAction func plusButtonClick(_ sender: Any) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.plusButton.transform = CGAffineTransform(rotationAngle: 90)
            if !self.isOpen {
                self.tbView.layoutIfNeeded()
                
                self.customNavBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
                self.isOpen = true
                self.vStackView.isHidden = false
            }else {
                print("close view")
                self.customNavBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 88)
                self.isOpen = false
                self.vStackView.isHidden = true
            }
            self.view.layoutIfNeeded()
        }){ (_) in
            UIView.animate(withDuration: 0.3) {
                self.plusButton.transform = .identity
            }
        }
    }
    
    func exemplo4(){
        UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.plusButton.transform = CGAffineTransform(rotationAngle: 90)
            if !self.isOpen {
                
                self.customNavBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
                self.isOpen = true
                self.vStackView.isHidden = false
            }else {
                print("close view")
                self.customNavBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 88)
                self.isOpen = false
                self.vStackView.isHidden = true
            }
            self.view.layoutIfNeeded()
        }){ (_) in
            UIView.animate(withDuration: 0.1) {
                self.plusButton.transform = .identity
            }
        }
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        let food = foods[indexPath.row]
        cell.textLabel?.text = food
        return cell
    }
}
