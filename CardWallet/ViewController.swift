//
//  ViewController.swift
//  CardWallet
//
//  Created by isec on 2019/6/18.
//  Copyright © 2019 huangrui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var isFirstLoad = true
    var isUpSlip = true
    var startSlipY: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .lightGray
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = -64
        layout.itemSize = CGSize(width: view.frame.size.width - 32, height: 200)
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCell.classForCoder(), forCellWithReuseIdentifier: "item")
        view.addSubview(collectionView)
    }

}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isFirstLoad {
            collectionView.bringSubviewToFront(cell)
        } else {
            if isUpSlip {
                collectionView.bringSubviewToFront(cell)
            } else {
                collectionView.sendSubviewToBack(cell)
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > startSlipY {
            isUpSlip = true
        } else {
            isUpSlip = false
        }
        startSlipY = scrollView.contentOffset.y
        print(isUpSlip)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isFirstLoad = false
    }
    
}
