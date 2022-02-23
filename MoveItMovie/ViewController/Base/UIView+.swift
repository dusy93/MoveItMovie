//
//  UIView+.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/22.
//

import Foundation
import UIKit

extension UIView {
    func addImageBorderColor(_ color: UIColor = CommonUtils.getColor(key: .IMAGE_BORDER)) {
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = 5
    }
    
    func addShadowColor(_ color: UIColor = CommonUtils.getColor(key: .TEXT_SHADOW)) {
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 2
        self.layer.shadowColor = color.cgColor
    }
}
