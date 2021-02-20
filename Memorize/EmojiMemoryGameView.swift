//
//  ContentView.swift
//  Memorize
//
//  Created by Haik Divanyan on 2/8/21.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var pairCount: Int {
        viewModel.cards.count
    }
    
    var themeName: String {
        viewModel.getThemeName()
    }
    
    var body: some View {
        VStack {
            Text(themeName)
                .font(.title)
            Text("Score: \(viewModel.getScore())")
            
            Grid(viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        withAnimation(.linear(duration: 0.65)) {
                            viewModel.choose(card: card)
                        }
                    }
                .padding()
                }
                    .padding()
            .foregroundColor(Color.orange)
            
            Button(action: {
                withAnimation(.easeInOut) {
                viewModel.resetGame()
                }
            }, label: {
                Text("RESET")
            })
        }
    }
    
    struct CardView: View {
        var card: MemoryGame<String>.Card
        
        @State private var animatedBonusRemaining: Double = 0
        
        private func startBonusTimeAnimation() {
            animatedBonusRemaining = card.bonusRemaining
            withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                animatedBonusRemaining = 0
            }
        }
        
        var body: some View {
            GeometryReader { geometry in
                if card.isFaceUp || !card.isMatched {
                ZStack {
                    Group {
                        if card.isConsumingBonusTime {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                                .onAppear {
                                    startBonusTimeAnimation()
                                }
                        } else {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                        }

                    }
                    .padding(5).opacity(0.4)
                    
                    Text(card.content)
                        .font(Font.system(size: fontSize(for: geometry.size)))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360: 0))
                        .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false): .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.scale)
            }
        }
            
    }
        // MARK: - Drawing Constants
        

        private func fontSize(for size: CGSize) -> CGFloat {
            min(size.width, size.height) * 0.70
        }
        
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
//            let game = EmojiMemoryGame()
//            game.choose(card: game.cards[0])
            return EmojiMemoryGameView(viewModel: EmojiMemoryGame())
                
        }
    }


}
