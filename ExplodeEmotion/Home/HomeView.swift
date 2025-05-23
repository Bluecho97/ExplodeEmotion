//
//  HomeView.swift
//  ExplodeEmotion
//
//  Created by  Lucid on 5/24/25.
//

import SwiftUI


struct HomeView: View {
    
    @State var path = NavigationPath()
    @State private var emotion: String = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.black.ignoresSafeArea(edges: .all)
                
                Image("Logo_blur")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                VStack {
                    ZStack {
                        TextEditor(text: $emotion)
                            .frame(width: 340, height: 120)
                            .padding(4)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        
                        if emotion.isEmpty {
                            VStack {
                                Text("내용을 입력하세요")
                                    .foregroundColor(.gray)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 80, trailing: 212))
                            }
                        }
                    }
                    
                    Button(action: {
                        path.append("First")
                    }, label: {
                        Text("Go")
                            .font(.system(size: 20))
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    })
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationDestination(for: String.self) { value in
                switch value {
                case "First": DescribeFeelingView(path: $path)
                default: Text("Invalid Page")
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
