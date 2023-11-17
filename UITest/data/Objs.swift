//
//  Objs.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import Foundation


struct Category : Codable{
    var name : String
    var image : String
}


struct Activity : Codable{
    var title : String
    var image : String
    var text : String
    var actin : String
    var textColor : Bool
}

struct UpComming : Codable {
    var title : String
    var image : String
    var time : String
}
