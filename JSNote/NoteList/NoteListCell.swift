//
//  NoteListCell.swift
//  JSNote
//
//  Created by 박진수 on 16/02/2020.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit

class NoteListCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func fill(note: JSNote) {
        titleLabel.text = note.title
        contentLabel.text = note.content
    }
}
