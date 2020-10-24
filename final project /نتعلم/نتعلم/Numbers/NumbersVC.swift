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
        title = "اضغط على الارقام!"
         }
//    @IBAction func IfNumberTap(_ sender: UIButton) {
//        switch sender.tag {
//        case 0:
//           print()
//        case 1:
//
//        default:
//            print("two2")
//        }
//    }
//
    
    @IBAction func Tap(_ sender: UIButton) {
         var indexNumber = sender.tag
        performSegue(withIdentifier: "Details", sender: indexNumber)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = sender as! Int
        let vc = segue.destination as! NumberData
        vc.indexNumber = sender
    }
    
    }


