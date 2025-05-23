
import SwiftUI

struct TrashPageView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Black background
                Color.black.ignoresSafeArea()
                
                // Centered, bigger, less blurred background image
                Image("background")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 380)
                    .blur(radius: 8)
                    .opacity(0.95)
                    .allowsHitTesting(false)
                
                // Centered trash can image as a button
                NavigationLink(destination: TrashPageListView()) {
                    Image("trash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .shadow(color: .black.opacity(0.15), radius: 12, y: 8)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    TrashPageView()
}




