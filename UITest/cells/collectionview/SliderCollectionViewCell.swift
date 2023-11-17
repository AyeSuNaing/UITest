//
//  SliderCollectionViewCell.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLbl.layer.shadowColor = UIColor.black.cgColor
        titleLbl.layer.shadowOffset = CGSize(width: 2, height: 2)
        titleLbl.layer.shadowOpacity = 0.5
        titleLbl.layer.shadowRadius = 4
    }

}
