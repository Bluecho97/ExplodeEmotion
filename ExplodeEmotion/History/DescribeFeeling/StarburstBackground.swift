


import SwiftUI

struct PixelText: View {
    let text: String
    let fontSize: CGFloat

    var body: some View {
        ZStack {
            Text(text)
                .font(.system(size: fontSize, weight: .black, design: .monospaced))
                .foregroundColor(.yellow)
                .offset(x: 4, y: 4)
            Text(text)
                .font(.system(size: fontSize, weight: .black, design: .monospaced))
                .foregroundColor(.red)
        }
    }
}

struct StarburstBackground: View {
    let tapCount: Int
    @Binding var path: NavigationPath

    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.75, blue: 0.2)
                .ignoresSafeArea()
            GeometryReader { geo in
                ZStack {
                    Ellipse()
                        .fill(Color.black.opacity(0.18))
                        .frame(width: geo.size.width * 1.1, height: geo.size.height * 0.25)
                        .position(x: geo.size.width / 2, y: geo.size.height * 0.62)
                        .blur(radius: 32)
                    Image("Vector")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width * 1.6, height: geo.size.height * 1.6)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        .ignoresSafeArea()
                }
            }
            VStack(spacing: 36) {
                Spacer()
                PixelText(text: "누른 횟수", fontSize: 36)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            path.append("Third") // 또는 원하는 페이지 이름
                        }
                    }
                PixelText(text: "\(tapCount)", fontSize: 140)
                Spacer()
                
            }
            
        }
    }
}

//#Preview {
//    StarburstBackground(tapCount: 10)
//}


