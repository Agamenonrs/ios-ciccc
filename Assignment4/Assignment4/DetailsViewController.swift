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
        
        // CREATE LABELS
        
        let countryLabel = UILabel()
        countryLabel.text = "Country"
        countryLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let country = UILabel()
        country.text = city.name
        country.font = UIFont(name: "Helvetica Neue", size: 20)
        country.translatesAutoresizingMaskIntoConstraints = false
        
        let countryStack = UIStackView(arrangedSubviews: [countryLabel,country])
        countryStack.translatesAutoresizingMaskIntoConstraints = false
        countryStack.axis = .vertical
        countryStack.alignment = .center
        countryStack.distribution = .equalSpacing
        countryStack.spacing = 10
        view.addSubview(countryStack)
    
        let cityLabel = UILabel()
        cityLabel.text = "City"
        cityLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let cityNameLabel = UILabel()
        cityNameLabel.text = city.name
        cityNameLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let cityStack = UIStackView(arrangedSubviews: [cityLabel,cityNameLabel])
        cityStack.translatesAutoresizingMaskIntoConstraints = false
        cityStack.axis = .vertical
        cityStack.alignment = .center
        cityStack.distribution = .equalSpacing
        cityStack.spacing = 10
        view.addSubview(cityStack)
        
        
        let mainStack = UIStackView(arrangedSubviews: [countryStack,cityStack])
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.alignment = .center
        mainStack.distribution = .equalSpacing
        mainStack.spacing = 20
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
          mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
          
        ])
  
    }
    
    func createLabelGroup(title : String, labelValue : String)-> UIStackView{
        let labelTitle = createLabel(label: title)
        
        let value = createLabel(label: labelValue)
        
        let stack = UIStackView(arrangedSubviews: [labelTitle,value])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 10
        view.addSubview(stack)
        return stack
    }
    
    func createLabel(label : String )-> UILabel{
        let country = UILabel()
        country.text = label
        country.font = UIFont(name: "Helvetica Neue", size: 20)
        country.translatesAutoresizingMaskIntoConstraints = false
        return country
    }
    
}
