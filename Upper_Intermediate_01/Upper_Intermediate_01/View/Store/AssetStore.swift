//
//  AssetStore.swift
//  Upper_Intermediate_01
//
//  Created by 고도 on 2023/01/19.
//

import Foundation

class AssetStore: ObservableObject {
    @Published var assets: [Asset] = load("assets.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError(filename + "을 찾을 수 없습니다.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError(filename + "을 찾을 수 없습니다.")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError(filename + "\(T.self)를 변환할 수 없습니다.")
    }
}
