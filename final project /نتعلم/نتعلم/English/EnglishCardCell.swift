//
//  EnglishCardCell.swift
//  نتعلم
//
//  Created by mariam alfoudari on 10/17/20.
//

import UIKit

class EnglishCardCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    var imageName:String?
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
        // Initialization code
//    }
    
    func loadContent() {
        if imageName == nil { return }
        if let image = UIImage(named:imageName!) {
            imageView.image = image
        }
        
        layer.cornerRadius = 30
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 3.5
    }

}

