//
//  Modifiers.swift
//  Upper_Intermediate_01
//
//  Created by 고도 on 2023/01/18.
//

import SwiftUI

struct NavigationBarButtonModifier: ViewModifier {
    var title: String = ""
    
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(
                leading: Text(title)
                    .font(.system(size: 24, weight: .bold))
                    .padding(),
                trailing: Button(action: {
                    
                }, label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("자산 추가")
                            .font(.system(size: 12))
                    }
                    .padding(8)
                    .overlay(
                        Capsule()
                            .strokeBorder(style: StrokeStyle(lineWidth: 2))
                    )
                    .foregroundColor(.black)
                })
            )
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithTransparentBackground()
                appearance.backgroundColor = UIColor(white: 1, alpha: 0.5)
                
                UINavigationBar.appearance()
                    .standardAppearance = appearance
                UINavigationBar.appearance()
                    .compactAppearance = appearance
                UINavigationBar.appearance()
                    .scrollEdgeAppearance = appearance
            }
    }
}

struct AssetMenuButtonStyle: ButtonStyle {
    let menu: AssetMenu
    
    func makeBody(configuration: Configuration) -> some View {
        return VStack {
            Image(systemName: menu.systemImageName)
                .resizable()
                .frame(width: 32, height: 32)
                .padding([.leading, .trailing], 8)
            
            Text(menu.title)
                .font(.system(size: 12, weight: .bold))
        }
        .padding()
        .foregroundColor(.black)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension View {
    func navigationBarWithButtonStyle(_ title: String) -> some View {
        return self.modifier(NavigationBarButtonModifier(title: title))
    }
}
