//
//  AssetView.swift
//  Upper_Intermediate_01
//
//  Created by 고도 on 2023/01/18.
//

import SwiftUI

struct AssetView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer()
                    AssetMenuGridView()
                }
            }
            .navigationBarWithButtonStyle("내 자산")
        }
    }
}

struct AssetView_Previews: PreviewProvider {
    static var previews: some View {
        AssetView()
    }
}
