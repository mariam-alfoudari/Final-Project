//
//  TheQuiz.swift
//  نتعلم
//
//  Created by mariam alfoudari on 10/23/20.
//

import Foundation

struct TheQuiz {
    
    var questionNumber : Int = 0
    var score : Int = 0

    //2-dimensional array to hold Question objects
    let questions = [
        Question(q: "هل هذا الرقم ١", a: "صح"),
        Question(q: "🐕 يبدا اسم هذا الحيوان بحرف الخاء", a: "خطا"),
        Question(q: " 🐪 يبدا اسم هذا الحيوان بحرف الجيم", a: "صح"),
        Question(q: "هناك اكثر من ٢٠ حرف باللغة العربية", a: "صح"),
        Question(q: "🐸 هذا ضفدع ", a: "صح"),
        Question(q: "", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    //getter methods
    mutating func getAnswer(_ selectedAnswer : String) -> Bool{
        let questionAnswer = questions[questionNumber].answer
        if selectedAnswer == questionAnswer{
            score += 1
            return true
        }else{
            return false
        }
    }
    
    func getQuestion() -> String {
        return questions[questionNumber].question
    }
    
    func getProgress() -> Float{
        return Float(questionNumber + 1) / Float(questions.count)
    }
    
    
    mutating func getNextQuestion(){
        if questionNumber + 1 < questions.count{
            questionNumber += 1
        }else{
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int{
        return score
    }
}
 
