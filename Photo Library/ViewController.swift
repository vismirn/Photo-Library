//
//  ViewController.swift
//  Photo Library
//
//  Created by Viktor Smirnov on 30.05.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var cellSize = MyCollectionViewConstants.CELL_COMPACT_REGULAR_SIZE
    var cellReuseID = MyCollectionViewConstants.CELL_ANY_ANY_REUSE_ID
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationController()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    
    
    
    //приставка objc ставиться только если функция идёт в #selector (метод, выше)
    @objc func addButtonPressed() {
    }
    
    @objc func sharedButtonPressed() {
    }
    
    
    func setupNavigationController() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        let sharedButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedButtonPressed))
        navigationItem.rightBarButtonItems = [sharedButton, addButton]
        
        let titleLabel = UILabel()
        titleLabel.text = "PHOTOS"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .darkGray
        let photoTitle = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.leftBarButtonItem = photoTitle
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
    
        return cell
        
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact
            && self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.regular){
            cellSize = MyCollectionViewConstants.CELL_COMPACT_REGULAR_SIZE
            cellReuseID = MyCollectionViewConstants.CELL_COMPACT_REGULAR_REUSE_ID
        } else {
            cellSize = MyCollectionViewConstants.CELL_ANY_ANY_SIZE
            cellReuseID = MyCollectionViewConstants.CELL_ANY_ANY_REUSE_ID
        }

        self.collectionView.reloadItems(
            at: self.collectionView.indexPathsForVisibleItems)
    }
     
//    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        return col
//    }
    
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForCellAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width/44, height: collectionView.frame.height)
    }
    
    
    
}



