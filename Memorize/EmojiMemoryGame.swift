//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Haik Divanyan on 2/8/21.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()


     private static func createMemoryGame() -> MemoryGame<String> {
        let theme = getRandomTheme()
        //let emojis: Array<String> = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs ?? Int.random(in: 2...4), gameTheme: theme) { pairIndex in theme.emojis[pairIndex] }
     }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func getThemeName() -> String {
        model.gameTheme.name
    }
    
    func getScore() -> Int {
        model.score
    }
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}
