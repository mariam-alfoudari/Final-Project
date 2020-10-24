//
//  EnterNameVC.swift
//  نتعلم
//
//  Created by Sun Altamimi on 10/24/20.
//

import UIKit

class EnterNameVC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func go(_ sender: Any) {
         name = nameField.text ?? ""

        if nameField.text!.count >= 2{
            performSegue(withIdentifier: "Detail", sender: name)
        }
        else{
           
            let alert = UIAlertController(title: "هيي انت ", message: " اكتب اسمك ياسخيف 🤨", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "انزيييين😩", style: .default, handler: nil))
           

            self.present(alert, animated: true)
            
        }
    }
    
    // Hint: `performSegue` is the way
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        var namee = sender as! String
        let vc = segue.destination as! ViewController
        namee = name
    }



}

