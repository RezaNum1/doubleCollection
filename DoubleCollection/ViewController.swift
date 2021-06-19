//
//  ViewController.swift
//  DoubleCollection
//
//  Created by Reza Harris on 19/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    let songs: [Song] = [
        Song(title: "Song A", ImageName: "songA", categorie: "Normal"),
        Song(title: "Song B", ImageName: "songB", categorie: "Hard")
    ]
    
    @IBOutlet weak var collectionViewA: UICollectionView!
    @IBOutlet weak var collectionViewB: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewA.delegate = self
        collectionViewA.dataSource = self
        
        collectionViewA.collectionViewLayout = UICollectionViewLayout()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionViewA.setCollectionViewLayout(layout, animated: true)
        
        
        collectionViewB.delegate = self
        collectionViewB.dataSource = self
//
        collectionViewB.collectionViewLayout = UICollectionViewLayout()
        
        let layoutB = UICollectionViewFlowLayout()
        layoutB.scrollDirection = .vertical
        layoutB.minimumLineSpacing = 5
        layoutB.minimumInteritemSpacing = 5
        collectionViewB.setCollectionViewLayout(layoutB, animated: true)
    }
}

extension ViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var normal = 0
        var hard = 0
        
        for i in songs {
            if i.categorie == "Normal" {
                normal += 1
            } else {
                hard += 1
            }
        }
        if (collectionView == collectionViewB) {
            return normal
        }
        
        return hard
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewA.dequeueReusableCell(withReuseIdentifier: "cellA", for: indexPath) as! CollectionCollectionViewCellA
        cell.titleLbl.text = songs[indexPath.row].title
        cell.imageView.image = UIImage(named: songs[indexPath.row].ImageName)
        if (collectionView == collectionViewB) {
            let cellB = collectionViewB.dequeueReusableCell(withReuseIdentifier: "cellB", for: indexPath) as! CollectionCollectionViewCellB
            cellB.titleLblB.text = songs[indexPath.row + 1].title
            cellB.imageViewB.image = UIImage(named: songs[indexPath.row + 1].ImageName)
            print("B")
            return cellB
        }
        print("A")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        return CGSize(width: widthPerItem, height: 300)
    }
    
    
}

