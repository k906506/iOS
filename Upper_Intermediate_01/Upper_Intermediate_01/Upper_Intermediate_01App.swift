//
//  Upper_Intermediate_01App.swift
//  Upper_Intermediate_01
//
//  Created by 고도 on 2023/01/18.
//

import SwiftUI

@main
struct Upper_Intermediate_01App: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AssetStore())
        }
    }
}
