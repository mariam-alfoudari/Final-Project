//
//  ViewController.swift
//  نتعلم
//
//  Created by mariam alfoudari on 10/18/20.
//

import UIKit
var name: String = ""
    class ViewController: UIViewController {
        @IBOutlet weak var nameField: UILabel!
       
        @IBOutlet weak var ArBbutton: UIButton!
        @IBOutlet weak var EngButton: UIButton!
        @IBOutlet weak var MathButton: UIButton!
        @IBOutlet weak var ShapesButton: UIButton!
        @IBOutlet weak var DrawButton: UIButton!
        @IBOutlet weak var QuizButton: UIButton!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            ArBbutton.layer.cornerRadius = 20
            EngButton.layer.cornerRadius = 20
            MathButton.layer.cornerRadius = 20
            ShapesButton.layer.cornerRadius = 20
            DrawButton.layer.cornerRadius = 20
            QuizButton.layer.cornerRadius = 20
            nameField.text! = ("هيا لنتعلم يا \(name)")
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
            navigationController?.navigationBar.titleTextAttributes = textAttributes
            // Do any additional setup after loading the view.
        }


    }

