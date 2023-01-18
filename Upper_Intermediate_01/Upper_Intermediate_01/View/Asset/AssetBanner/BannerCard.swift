//
//  BannerCard.swift
//  Upper_Intermediate_01
//
//  Created by 고도 on 2023/01/18.
//

import SwiftUI

struct BannerCard: View {
    let banner: AssetBanner
    
    var body: some View {
        Color(banner.backgroundColor)
            .overlay (
                VStack {
                    Text(banner.title)
                        .font(.title)
                    Text(banner.description)
                })
    }
}

struct BannerCard_Previews: PreviewProvider {
    static let banner = AssetBanner(title: "안녕하세요", description: "반갑습니다", backgroundColor: .blue)
    
    static var previews: some View {
        BannerCard(banner: banner)
    }
}
