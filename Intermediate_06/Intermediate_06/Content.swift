//
//  Content.swift
//  Intermediate_06
//
//  Created by 고도 on 2023/01/01.
//

import UIKit

struct Content: Decodable {
    let sectionType: SectionType
    let sectionName: String
    let contentItem: [Item]
    
    enum SectionType: String, Decodable {
        case basic
        case main
        case large
        case rank
    }
}

struct Item: Decodable {
    let description: String
    let imageName: String
    
    var image: UIImage {
        UIImage(named: imageName) ?? UIImage()
    }
}
