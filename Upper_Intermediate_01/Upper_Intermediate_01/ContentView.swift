//
//  ContentView.swift
//  Upper_Intermediate_01
//
//  Created by 고도 on 2023/01/18.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .asset
    
    enum Tab {
        case asset
        case recommand
        case alert
        case setting
    }
    
    var body: some View {
        TabView(selection: $selection) {
            AssetView()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("자산")
                }
                .tag(Tab.asset)
            
            Text("추천 기능 예정")
                .tabItem {
                    Image(systemName: "hand.thumbsup")
                    Text("추천")
                }
                .tag(Tab.recommand)
            
            Text("알람 기능 예정")
                .tabItem {
                    Image(systemName: "bell")
                    Text("알람")
                }
                .tag(Tab.alert)
            
            Text("설정 기능 예정")
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("설정")
                }
                .tag(Tab.setting)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
