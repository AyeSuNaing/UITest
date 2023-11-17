//
//  UpCommingCollectionViewCell.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import UIKit

class UpCommingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeView: UIView!
    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        timeView.layer.cornerRadius = 7
        img.layer.cornerRadius = 20
        
    }

}
