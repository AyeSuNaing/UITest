//
//  DetailTableViewCell.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var zoneLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var wayView: UIView!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        wayView.layer.borderColor = UIColor.gray.cgColor
        wayView.layer.borderWidth = 0.5
        
        zoneLbl.text = "ZONE 1"
        titleLbl.text = "Alligator Gar"
        descriptionLbl.text = "The largest of seven known gar species, this megafish hasatorpedo-shaped body in olive brown and comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may g known gar species, this megafish hasatorpedo-shaped body in olive brown and comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may gith glistening scales. It can grow up to 10 feet long, and historical reports suggest it may g known gar species, this megafish hasatorpedo-shaped body in olive brown and comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may gand comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may g known gar species, this megafish hasatorpedo-shaped body in olive brown and comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may gith glistening scales. It can grow up to 10 feet long, and historical reports suggest it may g known gar species, this megafish hasatorpedo-shaped body in olive brown and comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may gand comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may g known gar species, this megafish hasatorpedo-shaped body in olive brown and comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may gith glistening scales. It can grow up to 10 feet long, and historical reports suggest it may g known gar species, this megafish hasatorpedo-shaped body in olive brown and comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may gand comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may g known gar species, this megafish hasatorpedo-shaped body in olive brown and comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may gith glistening scales. It can grow up to 10 feet long, and historical reports suggest it may g known gar species, this megafish hasatorpedo-shaped body in olive brown and comes armored with glistening scales. It can grow up to 10 feet long, and historical reports suggest it may g"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
