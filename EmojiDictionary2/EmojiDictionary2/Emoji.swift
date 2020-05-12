//
//  Emoji.swift
//  EmojiDictionary2
//
//  Created by Agamenon Rocha Dos Santos on 11/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

struct Emoji {
    var symbol: String
    var name: String
    var deteilDescription: String
    var usage: String
    
    init(symbol: String, name: String, deteilDescription: String, usage: String){
        self.symbol = symbol
        self.name = name
        self.deteilDescription = deteilDescription
        self.usage = usage
    }
}
