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
        Question(q: "١\nهل هذا الرقم واحد؟" , a: "نعم"),
        Question(q: " 🐕\nهل يبدا اسم هذا الحيوان بحرف الخاء؟", a: "لا"),
        Question(q: " 🐑\nهل يبدا اسم هذا الحيوان بحرف الخاء؟", a: "نعم"),
        Question(q: " 💗\nهل يرمز هذا الرمز الي اللون الوردي؟", a: "نعم"),
        Question(q: " ٩ \nهل هذا الرقم سته؟", a: "لا"),
        Question(q: " 🖍\nهل هذا اللون الاحمر؟", a: "نعم"),
        Question(q: " 🐝\nهل تبدا هذي الحشرة بحرف النون؟", a: "نعم"),
        Question(q: " 👻\nهل يبدا اسم هذا الشي بحرف G؟", a: "نعم"),
       
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
 
