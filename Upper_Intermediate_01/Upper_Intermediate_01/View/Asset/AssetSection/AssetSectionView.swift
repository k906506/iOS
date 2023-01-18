//
//  AssetSectionView.swift
//  Upper_Intermediate_01
//
//  Created by 고도 on 2023/01/19.
//

import SwiftUI

struct AssetSectionView: View {
    @EnvironmentObject var assetStore: AssetStore
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(assetStore.assets) { assets in
                Text(assets.type.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                    .padding(.vertical, 16)
                
                ForEach(assets.data) { asset in
                    HStack {
                        Text(asset.title)
                            .font(.system(size: 18))
                        
                        Spacer()
                        
                        Text(asset.amount)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                    }
                    .padding(.bottom, 1)
                }
                
                Divider()
                    .padding(.top)
            }
        }
        .padding(.horizontal)
    }
}

struct AssetSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AssetSectionView().environmentObject(AssetStore())
    }
}
