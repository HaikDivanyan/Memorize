//
//  Themes.swift
//  Memorize
//
//  Created by Haik Divanyan on 2/10/21.
//

import Foundation



struct Theme {
    let name: String
    let emojis: [String]
    var numberOfPairs: Int?

    init(name: String, emojis: [String], numberOfPairs: Int?) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairs = numberOfPairs
    }
}


func getRandomTheme() -> Theme {
    let Themes = [Theme(name: "Summer", emojis: ["☀️","👙","🍉"], numberOfPairs: 3),
                  Theme(name: "Winter", emojis: ["☃️","❄️","🥶","🎅🏻"], numberOfPairs: nil),
                  Theme(name: "Fall", emojis: ["👻", "🎃", "🕷"], numberOfPairs: 3),
                  Theme(name: "Spring", emojis: ["🌼","🌸","🌦"], numberOfPairs: 3)]
    return Themes.randomElement()!
}
