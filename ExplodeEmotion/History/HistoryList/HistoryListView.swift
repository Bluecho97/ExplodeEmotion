

import SwiftUI

struct DroppingEmoji: Identifiable {
    let id = UUID()
    let emoji: String
    var xPosition: CGFloat
    var yPosition: CGFloat = -50 // Start above the screen
    var speed: Double
}

struct HistoryListView: View {
    @State private var emojis: [DroppingEmoji] = []
    @State private var timer: Timer?
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let allEmojis = ["😀", "🎉", "🍎", "🚀", "🌟", "❤️", "🐶", "🍀", "🎈", "🔥"]
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ForEach(emojis) { emoji in
                Text(emoji.emoji)
                    .font(.largeTitle)
                    .position(x: emoji.xPosition, y: emoji.yPosition)
                    .animation(.linear(duration: emoji.speed), value: emoji.yPosition)
            }
        }
        .onAppear {
            startDroppingEmojis()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    func startDroppingEmojis() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            let newEmoji = DroppingEmoji(
                emoji: allEmojis.randomElement() ?? "😀",
                xPosition: CGFloat.random(in: 20...(screenWidth - 20)),
                speed: Double.random(in: 3...6)
            )
            emojis.append(newEmoji)
            
            // Animate dropping
            withAnimation(.linear(duration: newEmoji.speed)) {
                if let index = emojis.firstIndex(where: { $0.id == newEmoji.id }) {
                    emojis[index].yPosition = screenHeight + 50
                }
            }
            
            // Remove emojis after they fall off screen
            DispatchQueue.main.asyncAfter(deadline: .now() + newEmoji.speed) {
                emojis.removeAll { $0.id == newEmoji.id }
            }
        }
    }
}

#Preview {
    HistoryListView()
}
