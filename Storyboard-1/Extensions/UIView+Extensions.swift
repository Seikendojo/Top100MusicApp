//
//  UIView+Extensions.swift
//  Storyboard-1
//
//  Created by Seiken Dojo on 2023-03-24.
//

import Foundation
import UIKit

extension UIView {
    func applyDropShadowStyle(offset: CGSize, opacity: Float, radius: CGFloat, color: UIColor = .darkGray) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
