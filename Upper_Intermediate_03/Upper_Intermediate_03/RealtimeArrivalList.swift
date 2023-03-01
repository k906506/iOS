//
//  RealtimeArrivalList.swift
//  Upper_Intermediate_03
//
//  Created by 고도현 on 2023/03/01.
//

import Foundation

struct RealtimeArrivalListResponseModel: Decodable {
    let realtimeArrivalList: [RealtimeArrival]
}

struct RealtimeArrival: Decodable {
    let lineNumber: String
    let remainTime: String
    let currentStation: String
    
    enum CodingKeys: String, CodingKey {
        case lineNumber = "trainLineNm"
        case remainTime = "arvlMsg2"
        case currentStation = "arvlMsg3"
    }
}
