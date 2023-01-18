//
//  AssetMenuGridView.swift
//  Upper_Intermediate_01
//
//  Created by 고도 on 2023/01/18.
//

import SwiftUI

struct AssetMenuGridView: View {
    let menuList: [[AssetMenu]] = [
        [.creditScore, .bankAccount, .investment, .loan],
        [.insurance, .creditCard, .cash, .realEstate]
    ]
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(menuList, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row) { menu in
                        Button(action: {}) {
                            Text("")
                        }
                        .buttonStyle(AssetMenuButtonStyle(menu: menu))
                    }
                }
            }
        }
    }
}

struct AssetMenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        AssetMenuGridView()
    }
}
