//
//  ViewController.swift
//  EmojiDictionary2
//
//  Created by Agamenon Rocha Dos Santos on 11/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face", deteilDescription: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", deteilDescription: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", deteilDescription: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "👮", name: "Police Officer", deteilDescription: "A police officer wearing a blue cap with a gold badge. He is smiling, and eager to help.", usage: "person of authority"),
        Emoji(symbol: "🐢", name: "Turtle", deteilDescription: "A cute turtle.", usage: "Something slow"),
        Emoji(symbol: "🐘", name: "Elephant", deteilDescription: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti", deteilDescription: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", deteilDescription: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", deteilDescription: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", deteilDescription: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart", deteilDescription: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore", deteilDescription: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", deteilDescription: "A black and white checkered flag.", usage: "completion")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
    let emoji = emojis[indexPath.row]
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = "\(emoji.deteilDescription)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(emojis[indexPath.row].symbol)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 40
        }
        return 80
    }
}

