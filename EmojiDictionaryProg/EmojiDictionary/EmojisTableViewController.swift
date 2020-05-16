//
//  EmojisTableViewController.swift
//  EmojiDictionary
//
//  Created by Agamenon Rocha Dos Santos on 12/05/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class EmojisTableViewController: UITableViewController {
    
    var emojis: [Emoji] = [
      Emoji(symbol: "😀", name: "Grinning Face", detailDescription: "A typical smiley face.", usage: "happiness"),
      Emoji(symbol: "😕", name: "Confused Face", detailDescription: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
      Emoji(symbol: "😍", name: "Heart Eyes", detailDescription: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
      Emoji(symbol: "👮", name: "Police Officer", detailDescription: "A police officer wearing a blue cap with a gold badge. He is smiling, and eager to help.", usage: "person of authority"),
      Emoji(symbol: "🐢", name: "Turtle", detailDescription: "A cute turtle.", usage: "Something slow"),
      Emoji(symbol: "🐘", name: "Elephant", detailDescription: "A gray elephant.", usage: "good memory"),
      Emoji(symbol: "🍝", name: "Spaghetti", detailDescription: "A plate of spaghetti.", usage: "spaghetti"),
      Emoji(symbol: "🎲", name: "Die", detailDescription: "A single die.", usage: "taking a risk, chance; game"),
      Emoji(symbol: "⛺️", name: "Tent", detailDescription: "A small tent.", usage: "camping"),
      Emoji(symbol: "📚", name: "Stack of Books", detailDescription: "Three colored books stacked on each other.", usage: "homework, studying"),
      Emoji(symbol: "💔", name: "Broken Heart", detailDescription: "A red, broken heart.", usage: "extreme sadness"),
      Emoji(symbol: "💤", name: "Snore", detailDescription: "Three blue \'z\'s.", usage: "tired, sleepiness"),
      Emoji(symbol: "🏁", name: "Checkered Flag", detailDescription: "A black and white checkered flag.", usage: "completion")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Emoji Dictionary"
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(gotToNextTVC(_:)))
        
    }
    
    @objc func gotToNextTVC(_ sender: UIBarButtonItem ){
        let studentsTVC = StudentsTableViewController()
        navigationController?.pushViewController(studentsTVC, animated: true)
        print("works")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = "\(emoji.detailDescription)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //    return section == 0 ? "Employees" : "Emoji Dictionary"
        return "Emoji Dictionary"
      }
      
      // MARK: - table view delegate (behavior)
      
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    if indexPath.section == 0 {
    //       print("\(students[indexPath.row])")
    //    } else {
           print("\(emojis[indexPath.row].symbol)")
    //    }
      }
      
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //    return indexPath.section == 0 ? 44.0 : 80
        return 60
      }
      
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let emojiToMove = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(emojiToMove, at: destinationIndexPath.row)
        tableView.reloadData()
      }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
      return .none
    }

}
