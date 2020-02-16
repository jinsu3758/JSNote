//
//  CALayer.swift
//  JSNote
//
//  Created by 박진수 on 16/02/2020.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit

extension CALayer {
    func setShadow(color: UIColor = .black, alpha: Float = 0.3, x: CGFloat = 0, y: CGFloat = 2, blur: CGFloat = 4, spread: CGFloat = 0) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
        }
    }
}
