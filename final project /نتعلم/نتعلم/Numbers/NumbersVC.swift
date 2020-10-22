//
//  NumbersVC.swift
//  نتعلم
//
//  Created by mariam alfoudari on 10/20/20.
//

import UIKit

class NumbersVC: UIViewController {
    @IBOutlet weak var NumberBtn0: UIButton!
    @IBOutlet weak var NumberBtn1: UIButton!
    @IBOutlet weak var NumberBtn2: UIButton!
    @IBOutlet weak var NumberBtn3: UIButton!
    @IBOutlet weak var NumberBtn4: UIButton!
    @IBOutlet weak var NumberBtn5: UIButton!
    @IBOutlet weak var NumberBtn6: UIButton!
    @IBOutlet weak var NumberBtn7: UIButton!
    @IBOutlet weak var NumberBtn8: UIButton!
    @IBOutlet weak var NumberBtn9: UIButton!
    


    override func viewDidLoad() {
      super.viewDidLoad()
        title = "اضغظ على الارقام!"
         }

    @IBAction func Tap(_ sender: UIButton) {
        performSegue(withIdentifier: "Details", sender: nil)
    }

}

