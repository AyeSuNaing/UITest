//
//  CategoryCollectionViewCell.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgBgView: UIView!
    @IBOutlet weak var catTitle: UILabel!
    @IBOutlet weak var catImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let itemWidth : CGFloat = ( UIScreen.main.bounds.width - 70 )  * 0.25
        imgBgView.layer.cornerRadius = itemWidth / 2
    }

}
