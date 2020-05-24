//
//  TextFieldTableViewCell.swift
//  HotelForm
//
//  Created by Agamenon Rocha Dos Santos on 19/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    private let textField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    }
    
    convenience init(placeholder: String) {
      self.init()
      contentView.addSubview(textField)
      textField.matchParent(padding: .init(top: 5, left: 16, bottom: 5, right: 16))
      textField.placeholder = placeholder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
