//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Agamenon Rocha Dos Santos on 07/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer]!

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
      var frequencyOfAnswers: [AnimalType: Int] = [:]
      let responseTypes = responses.map { $0.type }
      for response in responseTypes {
         let newCount: Int
         if let oldCount = frequencyOfAnswers[response] {
                newCount = oldCount + 1
         } else {
                newCount = 1
         }
         frequencyOfAnswers[response] = newCount
      }
      //verificar a necessidade
    /*let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
      { (pair1, pair2) -> Bool in
          return pair1.value > pair2.value
      })
 */
      let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 >
      $1.1 }.first!.key
        
       resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
       resultDefinitionLabel.text = mostCommonAnswer.definition
       
    }
    
}
