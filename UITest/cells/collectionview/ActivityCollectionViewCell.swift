//
//  ActivityCollectionViewCell.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var img: UIImageView!

    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var actionLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 20
        bgView.layer.borderColor = #colorLiteral(red: 0.3294117647, green: 0.3294117647, blue: 0.3294117647, alpha: 1)
        bgView.layer.borderWidth = 1
    }
    

}
