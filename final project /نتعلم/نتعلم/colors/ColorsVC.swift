//
//  ColorsVC.swift
//  نتعلم
//
//  Created by mariam alfoudari on 10/23/20.
//

import UIKit

class ColorsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var coolors = [ColorModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "الالوان"
        
        setupData()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 247/255, green: 243/255, blue: 233/255, alpha: 1.0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = ColorscollectionView()
        
////        let cellNib = UINib(nibName: "colorsCardCell", bundle: nil)
//        collectionView(forCellWithReuseIdentifier: "cardCell")
    }
    
    private func setupData() {
        var colors = ["061DB8", "E7B7CC", "F2C71D", "DD3207",
                      "A888BF", "BE8766", "#ffa500", "#008000",
                      "000000", "808080", "061DB8", "E7B7CC", "F2C71D", "DD3207",
                      "A888BF", "BE8766", "#ffa500", "#008000",
                      "000000", "808080","061DB8", "E7B7CC", "F2C71D", "DD3207",
                      "A888BF", "BE8766", "#ffa500", "#008000",
                      "000000", "808080",]
        
        let names = ["ازرق", "وردي", "اصفر", "احمر",
                     "ارجواني", "بني ", "برتقالي", "اخضر",
                     "اسود", "رمادي", "ازرق", "وردي",
                     "اصفر", "احمر", "ارجواني", "بني", "برتقالي",
                     "اخضر", "اسود", "رمادي", "ازرق",
                     "وردي", "اصفر", "احمر", "ارجواني",
                     "بني", "برتقالي", "اخضر", "اسود",
                     "رمادي"]
        
        for i in 0..<colors.count {
            let paint = ColorModel(color: UIColor().HexToColor(hexString: colors[i]), name: names[i])
            coolors.append(paint)
        }
        
    }


}

// MARK: UICollectionViewDataSource
extension ColorsVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coolors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! colorsCardCell
        cell.data = coolors[indexPath.row]
        cell.loadContent()
        
        return cell
    }
    
}

// MARK: UICollectionViewDelegate
extension ColorsVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

