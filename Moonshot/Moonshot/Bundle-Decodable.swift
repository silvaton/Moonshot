//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Ton Silva on 14/6/23.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [String: Astrounaut] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([String: Astrounaut].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
