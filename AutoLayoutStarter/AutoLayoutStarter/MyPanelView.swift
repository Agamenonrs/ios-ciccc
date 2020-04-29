//
//  MyPanelView.swift
//  AutoLayoutStarter
//
//  Created by Agamenon Rocha Dos Santos on 28/04/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class MyPanelView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
      self.init(frame: .zero)
      self.translatesAutoresizingMaskIntoConstraints = false
      self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}
