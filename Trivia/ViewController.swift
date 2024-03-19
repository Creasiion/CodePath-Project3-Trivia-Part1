//
//  ViewController.swift
//  Trivia
//
//  Created by Imani Cage on 3/18/24.
//

import Foundation
import UIKit
class ViewController: UIViewController{
    @IBOutlet weak var numQuestions: UILabel!
    @IBOutlet weak var categoryType: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    let questionSet = [
        TriviaQuestion(category: "Mathematics", question: "What does PEMDAS stand for?", answers: ["Parameter, Exponential, Multiplication, Division, Adjacent, Subdivision","Parabola, Expire, Margin, Division, Adjacent, Subtraction", "Parenthesis, Exponential, Multiplication, Division, Addition, Subtraction", "Pottery, Expedite, Multigenre, Decorate, Artistry, Structure"], correctAnswer: "Parenthesis, Exponential, Multiplication, Division, Addition, Subtraction"),
        TriviaQuestion(category: "Literature", question: "Shakespeare wrote all of these EXCEPT...?", answers: ["Romeo & Juliet", "Hamlet", "Othello", "The Great Gatsby"], correctAnswer: "The Great Gatsby"),
        TriviaQuestion(category: "Animals", question: "What is the fastest running animal on the planet?", answers: ["Peregrine Falcon", "Cheetah", "Brown Hare", "Sailfish"], correctAnswer: "Peregrine Falcon"),
        TriviaQuestion(category: "Animals", question: "What is the fastest swimming animal on the planet?", answers: ["Dolphin","Whale","Sailfish","Sea turtle"], correctAnswer: "Sailfish"),
        TriviaQuestion(category: "History", question: "When was the first motion picture created?", answers: ["1789", "1888", "1903", "1846"], correctAnswer: "1888")
    ]
    var numCorrectScore = 0
    var currQuestion = 0
    
    

    func displayQuestion(){
        if currQuestion < questionSet.count{
            numQuestions.text = "Question: \(currQuestion+1)/\(questionSet.count)"
            categoryType.text = questionSet[currQuestion].category
            question.text = questionSet[currQuestion].question
            button1.setTitle(questionSet[currQuestion].answers[0], for: .normal)
            button2.setTitle(questionSet[currQuestion].answers[1], for: .normal)
            button3.setTitle(questionSet[currQuestion].answers[2], for: .normal)
            button4.setTitle(questionSet[currQuestion].answers[3], for: .normal)
            
        }
    }
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if sender.currentTitle == questionSet[currQuestion].correctAnswer {
            numCorrectScore += 1
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.backgroundColor = UIColor.clear
            
            
            //Change the question if there are any, else display final score
            if self.currQuestion < self.questionSet.count - 1 {
                self.currQuestion += 1
                self.displayQuestion()
            } else {
                let alert = UIAlertController(title: "Quiz Complete", message: "Your score is \(self.numCorrectScore)/\(self.questionSet.count).", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
    }
}
