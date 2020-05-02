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
        
        let countryStack = createLabelGroup(title: "Country", labelValue: city.name)
        let cityStack = createLabelGroup(title: "City", labelValue: city.name)
        let temperatureStack = createLabelGroup(title: "Temparature", labelValue: String(city.temp))
        let summaryStack = createLabelGroup(title: "Summary", labelValue: city.summary)
        
        let mainStack = UIStackView(arrangedSubviews: [countryStack,cityStack,temperatureStack,summaryStack])
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
