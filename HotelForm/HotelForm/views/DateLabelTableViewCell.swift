//
//  DateLabelTableViewCell.swift
//  HotelForm
//
//  Created by Agamenon Rocha Dos Santos on 19/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class DateLabelTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    convenience init(title: String) {
      self.init(style: .value1, reuseIdentifier: nil)
      textLabel?.text = title
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
