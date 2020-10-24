//
//  File.swift
//  نتعلم
//
//  Created by mariam alfoudari on 10/18/20.
//

import UIKit
import AVFoundation
class ArabicVC: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    let imageNames = ["one", "two", "three", "four", "five", "six","seven", "eight", "nine", "ten", "eleven", "twelve","thirteen", "fourteen", "fiveteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty", "twentyone", "twentytwo", "twentythree", "twentyfour", "twentyfive", "twentysix", "twentyseven", "twentyeight"]
        lazy var cardLayout: CardCollectionViewLayoutAR = {
        let layout = CardCollectionViewLayoutAR()
        layout.maximumVisibleItems = 4
        return layout
    }()
    
    var ArabicSong: AVAudioPlayer?
    
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
        
        let barButton = UIBarButtonItem(title: "العب الموسيقى", style: .done, target: self, action: #selector(play) )
        navigationItem.setRightBarButton(barButton, animated: false)
    }
    
    @objc func play(){
        do {
            let path = Bundle.main.path(forResource: "ArabicSong.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            ArabicSong = try AVAudioPlayer(contentsOf: url)
            ArabicSong?.play()
        } catch {
        print("ArabicSongIsNotPlaying")
    }
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
        cell.loadContent2()
        return cell
    }
    
}

// MARK: UICollectionViewDelegate
extension ArabicVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

