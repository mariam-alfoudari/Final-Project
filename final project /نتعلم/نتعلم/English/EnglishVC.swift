//
//  EnglishVC.swift
//  نتعلم
//
//  Created by mariam alfoudari on 10/17/20.
//

import UIKit
import AVFoundation

class EnglishVC: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    let imageNames = ["1", "2", "3", "4", "5", "6","7", "8", "9", "10", "11", "12","13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26",]
        lazy var cardLayout: CardCollectionViewLayout = {
        let layout = CardCollectionViewLayout()
        layout.maximumVisibleItems = 4
        return layout
    }()
    
    var EnglishSong: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "الاحرف الانجليزية"
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
        
        let barButton = UIBarButtonItem(title: "play song", style: .done, target: self, action: #selector(play1) )
        navigationItem.setRightBarButton(barButton, animated: false)
    }
    @objc func play1(){
        do {
            let path = Bundle.main.path(forResource: "EnglishSong.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            EnglishSong = try AVAudioPlayer(contentsOf: url)
            EnglishSong?.play()
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
extension EnglishVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EnglishCardCell", for: indexPath) as! EnglishCardCell
        cell.imageName = imageNames[indexPath.row]
        cell.loadContent()
        return cell
    }
    
}

// MARK: UICollectionViewDelegate
extension EnglishVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
