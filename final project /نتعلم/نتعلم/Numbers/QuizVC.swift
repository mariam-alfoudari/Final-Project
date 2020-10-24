//
//  QuizVC.swift
//  نتعلم
//
//  Created by mariam alfoudari on 10/23/20.
//

import UIKit

class QuizVC: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //declaring and initializing variables
    var currentProgress : Int = 0
    var theQuiz : TheQuiz = TheQuiz()
    var score : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        scoreLabel.text = "النقاط : \(score)"
        updateUI()
    }
    
    //function to invoke on button press
    @IBAction func buttonClick(_ sender: UIButton) {
        
       
        let selectedValue = sender.currentTitle!
        let isCorrect = theQuiz.getAnswer(selectedValue)
        if isCorrect {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        theQuiz.getNextQuestion()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            sender.backgroundColor = UIColor.clear
        })
        updateUI()
    }
    
    //function to Update the UI
    func updateUI(){

        progressBar.progress = theQuiz.getProgress()
        if theQuiz.questionNumber < theQuiz.questions.count {
            questionLabel.text = theQuiz.getQuestion()
        }
        scoreLabel.text = "النقاط : \(theQuiz.getScore())"
    }
    
}

