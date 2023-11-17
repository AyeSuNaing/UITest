//
//  Extender.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import Foundation
import UIKit



@objc protocol ClickedDelegate: AnyObject {
    func clickedItem ()
}


extension UITableViewCell {
    
    static var identifier: String{
        String(describing: self)
    }
}

extension UICollectionViewCell {
    
    static var identifier: String{
        String(describing: self)
    }
}

extension UIViewController {
    
    static var identifier: String{
        String(describing: self)
    }
    
    func navigateToDetailViewController() -> DetailViewController {
        
        guard let viewcontroller = UIStoryboard.mainStoryBoard().instantiateViewController(withIdentifier: DetailViewController.identifier)
            as? DetailViewController else { return DetailViewController() }
        viewcontroller.modalPresentationStyle = .overFullScreen
        viewcontroller.modalTransitionStyle = .crossDissolve
        return viewcontroller
        
        
    }
    
}

enum StoryBoardName: String{
    case Main = "Main"
}

extension UIStoryboard{
    static func mainStoryBoard()-> UIStoryboard{
        UIStoryboard(name: "Main", bundle: nil)
    }
    
    
}

