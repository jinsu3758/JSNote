//
//  JSTextView.swift
//  JSNote
//
//  Created by 박진수 on 21/02/2020.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit

protocol JSTextViewDelegate {
    func textViewDetectedBackSpace(_ textView: UITextView)
}


class JSTextView: UITextView {
    var jsDelegate: JSTextViewDelegate?
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
//        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func deleteBackward() {
        jsDelegate?.textViewDetectedBackSpace(self)
        super.deleteBackward()
    }

}

extension JSTextView: UITextViewDelegate {
    
}
