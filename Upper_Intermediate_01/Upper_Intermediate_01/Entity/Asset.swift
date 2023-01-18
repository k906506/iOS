//
//  Asset.swift
//  Upper_Intermediate_01
//
//  Created by 고도 on 2023/01/19.
//

import Foundation

struct Asset: Identifiable, Decodable {
    let id: Int
    let type: AssetMenu
    let data: [AssetData]
}

struct AssetData: Identifiable, Decodable {
    let id: Int
    let title: String
    let amount: String
}
