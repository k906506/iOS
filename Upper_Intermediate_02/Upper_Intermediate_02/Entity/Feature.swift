//
//  Feature.swift
//  Upper_Intermediate_02
//
//  Created by 고도 on 2023/01/20.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL : String
}
