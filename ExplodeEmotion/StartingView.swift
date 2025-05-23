
/*
import SwiftUI

struct StartingView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Black background
                Color.black.ignoresSafeArea()
                
                // Centered, bigger, less blurred background image
                Image("logo1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 380)
                VStack{
                    Spacer()
                    Text("이제는 당신의 감정을\n마음껏 표현하세요.")
                                            .font(.system(size: 20, weight: .medium, design: .monospaced))
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                            .shadow(color: .black, radius: 2, x: 1, y: 1)
                                            .padding(.bottom, 40)
                }
                
        
            }
        }
        
    }
}

#Preview {
    StartingView()
}
*/

import SwiftUI

struct StartingView: View {
    @State private var navigate = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Black background
                Color.black.ignoresSafeArea()
                
                // Centered, bigger, less blurred background image
                Image("logo1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 380)
                VStack{
                    Spacer()
                    Text("이제는 당신의 감정을\n마음껏 표현하세요.")
                        .font(.system(size: 20, weight: .medium, design: .monospaced))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .black, radius: 2, x: 1, y: 1)
                        .padding(.bottom, 40)
                }
            }
            // NavigationLink triggered by state
            .navigationDestination(isPresented: $navigate) {
                ContentView()
            }
            .onAppear {
                // Change to ContentView after 3 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    navigate = true
                }
            }
        }
    }
}


#Preview {
    StartingView()
}
