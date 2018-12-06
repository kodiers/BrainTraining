//
//  ViewController.swift
//  BrainTraining
//
//  Created by Viktor Yamchinov on 29/11/2018.
//  Copyright © 2018 Viktor Yamchinov. All rights reserved.
//

import UIKit

struct Question {
    var text: String
    var correct: Int
    var actual: Int?
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var drawView: DrawingImageView!
    
    var questions = [Question]()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Brain training"
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 1
        drawView.delegate = self
        askQuestion()
        
    }
    
    func numberDrawn(_ image: UIImage) {
        askQuestion()
    }
    
    func setText(for cell: UITableViewCell, at indexPath: IndexPath, to question: Question) {
        if indexPath.row == 0 {
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 48)
        } else {
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
        }
        
        if let actual = question.actual {
            cell.textLabel?.text = "\(question.text) = \(actual)"
        } else {
            cell.textLabel?.text = "\(question.text) = ?"
        }
    }
    
    func createQuestion() -> Question {
        var question = ""
        var correctAnswer = 0
        while true {
            let firstNumber = Int.random(in: 0...9)
            let secondNumber = Int.random(in: 0...9)
            if Bool.random() == true {
                let result = firstNumber + secondNumber
                if result < 10 {
                    question = "\(firstNumber) + \(secondNumber)"
                    correctAnswer = result
                    break
                }
            } else {
                let result = firstNumber - secondNumber
                if result >= 0 {
                    question = "\(firstNumber) - \(secondNumber)"
                    correctAnswer = result
                    break
                }
            }
        }
        return Question(text: question, correct: correctAnswer, actual: nil)
    }
    
    func askQuestion() {
        drawView.image = nil
        questions.insert(createQuestion(), at: 0)
        let newIndexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .right)
        let secondIndexPath = IndexPath(row: 1, section: 0)
        if let cell = tableView.cellForRow(at: secondIndexPath) {
            setText(for: cell, at: secondIndexPath, to: questions[1])
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentQuestion = questions[indexPath.row]
        setText(for: cell, at: indexPath, to: currentQuestion)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }

}

