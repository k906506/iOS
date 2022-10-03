//
//  CityCovidOverView.swift
//  Basic_08
//
//  Created by 고도 on 2022/09/26.
//

import Foundation

struct CovidOverview: Codable {
    let countryNm: String
    let totalCnt: Int
    let recCnt: Int
    let deathCnt: Int
    let isolCnt: Int
    let qurRate: Int
    let incDec: Int
    let incDecK: Int
    let incDecF: Int
}

struct CityCovidOverview: Codable {
    let korea: CovidOverview
    let seoul: CovidOverview
    let busan: CovidOverview
    let daegu: CovidOverview
    let incheon: CovidOverview
    let gwangju: CovidOverview
    let daejeon: CovidOverview
    let ulsan: CovidOverview
    let sejong: CovidOverview
    let gyeonggi: CovidOverview
    let gangwon: CovidOverview
    let chungbuk: CovidOverview
    let chungnam: CovidOverview
    let jeonnam: CovidOverview
    let gyeongbuk: CovidOverview
    let gyeongnam: CovidOverview
    let jeju: CovidOverview
}
