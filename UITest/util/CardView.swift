//
//  CardView.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import Foundation
import UIKit

@IBDesignable

class CardView : UIView {
    @IBInspectable var cornerRadius : CGFloat = 5
    @IBInspectable var shadowOffsetWidth : Int = 0
    @IBInspectable var shadowOffsetHeight : Int = 3
    @IBInspectable var shadowColor : UIColor? = UIColor.black
    @IBInspectable var shadowOpacity : Float = 0.5
    @IBInspectable var maskToBound : Bool = false
    override func layoutSubviews() {
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = maskToBound
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        layer.cornerRadius = cornerRadius

    }
}
