//
//  StationResponseModel.swift
//  Upper_Intermediate_03
//
//  Created by 고도현 on 2023/02/28.
//

import Foundation

struct StationResponseModel: Decodable {
    var stations: [Station] { response.row }
    
    private let response: SearchInfoBySubwayNameServiceModel
    
    enum CodingKeys: String, CodingKey {
        case response = "SearchInfoBySubwayNameService"
    }
}

struct SearchInfoBySubwayNameServiceModel: Decodable {
    let row: [Station]
}

struct Station: Decodable {
    let stationName: String
    let lineNumber: String
    
    enum CodingKeys: String, CodingKey {
        case stationName = "STATION_NM"
        case lineNumber = "LINE_NUM"
    }
}
