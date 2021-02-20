//
//  Array+Identification.swift
//  Memorize
//
//  Created by Haik Divanyan on 2/10/21.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
