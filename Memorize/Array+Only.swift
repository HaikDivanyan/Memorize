//
//  Array+Only.swift
//  Memorize
//
//  Created by Haik Divanyan on 2/10/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
