//
//  WeatherResponse.swift
//  Basic_07
//
//  Created by 고도 on 2022/09/23.
//

import Foundation

struct UserWeatherResponse: Codable {
    let response: WeatherResponse
}

struct WeatherResponse: Codable {
    let body: WeatherBody
    let header: WeatherHeader
}

struct WeatherBody: Codable {
    let totalCount: Int
    let items: [WeatherItem]
}

struct WeatherItem: Codable {
    let pm10Value: String
    let pm25Value: String
    let o3Value: String
    let no2Value: String
    let dataTime: String
}

struct WeatherHeader: Codable {
    let resultMsg: String
    let resultCode: String
}
