//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by Agamenon Rocha Dos Santos on 02/05/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var city : City!
    
    
    var cityButton: UIButton = {
      let btn = UIButton(type: .system)
      btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.backgroundColor = .white
      btn.translatesAutoresizingMaskIntoConstraints = false
      return btn
    }()
    
    var flagButton: UIButton = {
      let btn = UIButton(type: .system)
      btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.backgroundColor = .white
      btn.translatesAutoresizingMaskIntoConstraints = false
      return btn
    }()
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // CRIANDO LABEL
        
        let countryLabel = UILabel()
        countryLabel.text = "Country"
        countryLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let country = UILabel()
        country.text = "Canada"
        country.font = UIFont(name: "Helvetica Neue", size: 20)
        country.translatesAutoresizingMaskIntoConstraints = false
        /*
        let country = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 200, width: 300, height: 50))
        country.text = "Canada"
        country.textAlignment = .center
        country.font = UIFont(name: "Helvetica Neue", size: 20)
 */
        //view.addSubview(countryLabel)
        //view.addSubview(country)
       
        // FIM DO LABEL
       /*
        cityButton.setTitle(city.name, for: .normal)
        flagButton.setTitle(city.name, for: .normal)
        //print(this is the icon \(city.icon)
        print("this is the icon\(city.icon)")
        flagButton.setImage(UIImage(systemName: city.icon), for: .normal)
        navigationController?.title = city.name
         */
        
        let stackDetails = UIStackView(arrangedSubviews: [countryLabel,country])
           stackDetails.translatesAutoresizingMaskIntoConstraints = false
           stackDetails.axis = .vertical
           stackDetails.alignment = .center
           stackDetails.distribution = .equalSpacing
           stackDetails.spacing = 10
           view.addSubview(stackDetails)
        NSLayoutConstraint.activate([
          stackDetails.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          stackDetails.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

           
//           NSLayoutConstraint.activate([
//             stackDetails.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//             stackDetails.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//             countryLabel.heightAnchor.constraint(equalToConstant: 100),
//             countryLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
//             country.heightAnchor.constraint(equalToConstant: 100),
//             country.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
//
//           ])
        
  }
 

}
