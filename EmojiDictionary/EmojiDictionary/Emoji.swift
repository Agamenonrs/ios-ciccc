//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Agamenon Rocha Dos Santos on 11/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

struct Emogi {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String){
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
