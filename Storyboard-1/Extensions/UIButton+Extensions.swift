//
//  UIButton+Extensions.swift
//  Storyboard-1
//
//  Created by Seiken Dojo on 2023-03-24.
//

import Foundation
import UIKit

extension UIButton {
    func makeButtonRounded() {
        layer.borderColor = UIColor.orange.cgColor
        layer.borderWidth = 1.5
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    }
}
