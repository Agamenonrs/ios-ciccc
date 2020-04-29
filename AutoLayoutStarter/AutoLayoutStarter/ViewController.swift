//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
   let mainView: UIView = {
   let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
    
    var blurPanel1 = MyPanelView()
    var blurPanel2 = MyPanelView()
    var blurPanel3 = MyPanelView()
    
    var topView1 : MyTopView!
    var topView2 : MyTopView!
    var topView3 : MyTopView!
    
    var recPurple : UIView = {
        //let rectangle = UIView(frame : CGRect.zero )
        let rectangle = UIView(frame : CGRect.zero )
        rectangle.backgroundColor = .purple
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        return rectangle
    }()
        
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    mainView.addSubview(recPurple)
    
    NSLayoutConstraint(item: recPurple, attribute: .width, relatedBy: .equal, toItem: mainView, attribute: .width, multiplier: 0.6, constant: 0.0).isActive = true
//    NSLayoutConstraint(item: recPurple, attribute: .height, relatedBy: .equal, toItem: mainView, attribute: .height, multiplier: 0.15, constant: 0.0).isActive = true
    recPurple.heightAnchor.constraint(equalToConstant: 25).isActive = true
    NSLayoutConstraint(item: recPurple, attribute: .bottomMargin, relatedBy: .equal, toItem: mainView, attribute: .bottomMargin, multiplier: 0.95, constant: 0.0).isActive = true
    NSLayoutConstraint(item: recPurple, attribute: .leftMargin, relatedBy: .equal, toItem: mainView, attribute: .leftMargin, multiplier: 10, constant: 0.0).isActive = true
    createStack()
    createTopViews()
    /*
    recPurple.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.60).isActive = true
    recPurple.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.15).isActive = true
    recPurple.leadingAnchor.constraint(equalToSystemSpacingAfter: mainView.leadingAnchor, multiplier: 9).isActive = true
    */
    setupLayout()
  }
    func createTopViews(){
        topView1 = MyTopView(parentView: mainView, color: .red)
        topView2 = MyTopView(parentView: topView1, color: .orange)
        topView3 = MyTopView(parentView: topView1, color: .orange)
        NSLayoutConstraint.activate([
            topView1.widthAnchor.constraint(equalToConstant: 100),
            topView1.heightAnchor.constraint(equalToConstant: 40),
            topView1.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            topView1.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            topView2.widthAnchor.constraint(equalTo: topView1.widthAnchor, multiplier: 0.55),
            topView2.heightAnchor.constraint(equalTo: topView1.heightAnchor, multiplier: 0.80),
            topView2.topAnchor.constraint(equalToSystemSpacingBelow: topView1.topAnchor, multiplier: 0.20),
            topView2.leadingAnchor.constraint(equalToSystemSpacingAfter: topView1.leadingAnchor, multiplier: 0.20),
            topView3.widthAnchor.constraint(equalTo: topView1.widthAnchor, multiplier: 0.34),
            topView3.heightAnchor.constraint(equalTo: topView1.heightAnchor, multiplier: 0.90),
            topView3.topAnchor.constraint(equalToSystemSpacingBelow: topView1.topAnchor, multiplier: 0.20),
            topView3.trailingAnchor.constraint(equalToSystemSpacingAfter: topView1.trailingAnchor, multiplier: 0.30)
        ])
    }
    
    func createStack() {
        let vStackView = UIStackView(arrangedSubviews: [blurPanel1, blurPanel2, blurPanel3])
        
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.axis = .vertical
        vStackView.alignment = .center
        vStackView.distribution = .equalSpacing
        vStackView.spacing = 50
        mainView.addSubview(vStackView)
        
        NSLayoutConstraint.activate([
          vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          vStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
          blurPanel1.heightAnchor.constraint(equalToConstant: 50),
          blurPanel1.widthAnchor.constraint(equalToConstant: 50),
          blurPanel2.heightAnchor.constraint(equalTo: blurPanel1.heightAnchor),
          blurPanel2.widthAnchor.constraint(equalTo: blurPanel1.widthAnchor),
          blurPanel3.heightAnchor.constraint(equalTo: blurPanel1.heightAnchor),
          blurPanel3.widthAnchor.constraint(equalTo: blurPanel1.widthAnchor),
        ])
    }
    
  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

