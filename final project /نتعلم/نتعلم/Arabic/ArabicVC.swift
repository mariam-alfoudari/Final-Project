//
//  File.swift
//  نتعلم
//
//  Created by mariam alfoudari on 10/18/20.
//

import UIKit
class ArabicVC: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    let imageNames = ["one", "two", "three", "four", "five", "six","seven", "eight", "nine", "ten", "eleven", "twelve","thirteen", "fourteen", "fiveteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty", "twentyone", "twentytwo", "twentythree", "twentyfour", "twentyfive", "twentysix", "twentyseven", "twentyeight"]
        lazy var cardLayout: CardCollectionViewLayoutAR = {
        let layout = CardCollectionViewLayoutAR()
        layout.maximumVisibleItems = 4
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "الاحرف العربية"
        setupView()
    }
    
    fileprivate func setupView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = cardLayout
        
//        let cellNib = UINib(nibName: "EnglishCardCell", bundle: nil)
//        collectionView.register(cellNib, forCellWithReuseIdentifier: "EnglishCardCell")
        
        let barButton = UIBarButtonItem(title: "play song", style: .done, target: self, action:"" )
        navigationItem.setRightBarButton(barButton, animated: false)
    }
//
//    @objc fileprivate func switchLayout() {
//        if cardLayout.maximumVisibleItems == 26 {
//            cardLayout.maximumVisibleItems = 4
//        } else {
//            cardLayout.maximumVisibleItems = 6
//        }
//    }
}

// MARK: UICollectionViewDataSource
extension ArabicVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArabicCardCell", for: indexPath) as! ArabicCardCell
        cell.imageName = imageNames[indexPath.row]
        cell.loadContent()
        return cell
    }
    
}

// MARK: UICollectionViewDelegate
extension ArabicVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
