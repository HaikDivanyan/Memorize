//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Haik Divanyan on 2/8/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
