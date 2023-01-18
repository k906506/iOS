//
//  AssetBannerView.swift
//  Upper_Intermediate_01
//
//  Created by 고도 on 2023/01/18.
//

import SwiftUI

struct AssetBannerView: View {
    let bannerList: [AssetBanner] = [
        AssetBanner(title: "공지사항", description: "추가된 공지사항을 확인하세요", backgroundColor: .red),
        AssetBanner(title: "주말 이벤트", description: "주말 이벤트를 놓치지 마세요.", backgroundColor: .green),
        AssetBanner(title: "깜짝 이벤트", description: "엄청난 이벤트에 놀라지 마세요", backgroundColor: .blue),
        AssetBanner(title: "가을 프로모션", description: "가을 프로모션을 기대해주세요", backgroundColor: .yellow),
    ]
    @State private var currentPage = 0
    
    var body: some View {
        let bannerCards = bannerList.map { BannerCard(banner: $0) }
        
        ZStack(alignment: .bottom) {
            PageViewController(pages: bannerCards, currentPage: $currentPage)
            
            PageControl(numberOfPages: bannerCards.count, currentPage: $currentPage)
                .frame(width: CGFloat(bannerCards.count * 10))
                .padding(8)
        }
    }
}

struct AssetBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AssetBannerView()
    }
}
