
import SwiftUI
import AudioToolbox

struct DescribeFeelingView: View {
    @Binding var path: NavigationPath

    @State private var tapCount = 0
    @State private var timeLeft = 10
    @State private var timerActive = true
    
    @State private var isVisible = false
    @State private var showResult = false // For showing StarburstBackground

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                Spacer().frame(height: 40)
                Text("TIME")
                    .font(.system(size: 32, weight: .bold, design: .monospaced))
                    .foregroundColor(.red)
                    .shadow(color: .red, radius: 6)
                Text("\(timeLeft)")
                    .font(.system(size: 80, weight: .heavy, design: .monospaced))
                    .foregroundColor(.red)
                    .shadow(color: .red, radius: 8)
                    .padding(.bottom, 32)
                
                if timeLeft == 0 {
                    Text("시간 종료!")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                path.append("Second") // 또는 원하는 페이지 이름
                                isVisible = true
                            }
                        }
                }
                
                // 누른 횟수 and tap count
                HStack(spacing: 12) {
                    Text("누른 횟수")
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
                        .foregroundColor(.red)
                        .shadow(color: .red, radius: 6)
                    Text("\(tapCount)")
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
                        .foregroundColor(.red)
                        .shadow(color: .red, radius: 6)
                }
                .padding(.bottom, 8)
                HStack(spacing: 32) {
                    Rectangle()
                        .frame(width: 60, height: 2)
                        .foregroundColor(.red)
                    Rectangle()
                        .frame(width: 60, height: 2)
                        .foregroundColor(.red)
                }
                .padding(.bottom, 36)
                Text("Click!")
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                    .foregroundColor(.red)
                    .shadow(color: .red, radius: 6)
                    .padding(.bottom, 8)
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color.red, Color.orange.opacity(0.8)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: .red, radius: 8)
                    .padding(.bottom, 16)
                Button(action: {
                    if timerActive {
                        tapCount += 1
                        let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
                        impactFeedback.impactOccurred()
                        AudioServicesPlaySystemSound(1005)
                    }
                }) {
                    Image("Group") // Replace with your asset name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 340, height: 180)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 8, y: 8)
                        .padding(.top, 10)
                        .opacity(timerActive ? 1.0 : 0.5)
                }
                .buttonStyle(PlainButtonStyle())
                .disabled(!timerActive)
                Spacer()
            }
            .padding(.horizontal, 24)
        }//
        .onReceive(timer) { _ in
            guard timerActive else { return }
            if timeLeft > 0 {
                timeLeft -= 1
            } else {
                timerActive = false
                showResult = true
            }
        }
        .fullScreenCover(isPresented: $showResult) {
            StarburstBackground(tapCount: tapCount, path: $path)
        }
    }
}

#Preview {
    DescribeFeelingView(path: .constant(NavigationPath()))
}



