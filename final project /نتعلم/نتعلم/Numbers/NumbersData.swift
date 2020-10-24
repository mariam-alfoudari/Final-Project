//
//  NumbersData.swift
//  نتعلم
//
//  Created by mariam alfoudari on 10/20/20.
//

import UIKit
class NumberData: UIViewController {

    @IBOutlet weak var NumberImg: UIImageView!
    var  indexNumber : Int!
    var images = ["one1","two2","three3","four4","five5","six6","seven7","eight8", "nine9","ten10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NumberImg.image = UIImage(named: images[indexNumber])
    }
//    var NumberData: [Numbers]  = [
//        Numbers(ShowNumber: #imageLiteral(resourceName: "one1") ),
//
//    ]

}
