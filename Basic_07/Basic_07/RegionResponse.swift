//
//  Region.swift
//  Basic_07
//
//  Created by 고도 on 2022/09/21.
//

import Foundation


struct UserRegionResponse: Codable {
    let response: RegionResponse
}

struct RegionResponse: Codable {
    let body: RegionBody
    let header: RegionHeader
}

struct RegionBody: Codable {
    let totalCount: Int
    let items: [RegionItem]
    let pageNo: Int
    let numOfRows: Int
}

struct RegionHeader: Codable {
    let resultMsg: String
    let resultCode: String
}

struct RegionItem: Codable {
    let dmX: String
    let dmY: String
    let item: String
    let mangName: String
    let year: String
    let addr: String
    let stationName: String
}
