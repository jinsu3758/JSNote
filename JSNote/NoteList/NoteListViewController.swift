//
//  NoteListViewController.swift
//  JSNote
//
//  Created by 박진수 on 16/02/2020.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit

class NoteListViewController: UIViewController {
    @IBOutlet weak var noteListCollectionView: UICollectionView!
    @IBOutlet weak var writeNoteButton: UIButton!
    var testList: [JSNote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        writeNoteButton.layer.setShadow()
        noteListCollectionView.delegate = self
        noteListCollectionView.dataSource = self
        
        testList.append(JSNote(title: "와우", content: "안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~"))
        testList.append(JSNote(title: "와우", content: "안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~"))
        testList.append(JSNote(title: "와우", content: "안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~"))
        testList.append(JSNote(title: "와우", content: "안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~안녕하세요~~~~~~~~~~~~~~~~~~"))
        noteListCollectionView.reloadData()
    }


}

extension NoteListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noteListCell", for: indexPath) as? NoteListCell {
            cell.fill(note: testList[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let edgeInsets = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
        
        return CGSize(width: collectionView.frame.width - edgeInsets.left - edgeInsets.right, height: 245)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 14, bottom: 14, right: 14)
    }
    
    
    
}
