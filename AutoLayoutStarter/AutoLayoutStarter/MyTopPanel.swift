//
//  MyTopPanel.swift
//  AutoLayoutStarter
//
//  Created by Agamenon Rocha Dos Santos on 28/04/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//


import UIKit

class MyTopView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(parentView : UIView, color : UIColor) {
      self.init(frame: .zero)
      self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        parentView.addSubview(self)
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}
