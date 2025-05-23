//
//  HistoryView.swift
//  ExplodeEmotion
//
//  Created by  Lucid on 5/24/25.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(edges: .all)
            Image("Logo_blur")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            VStack {
                Text("WHAT THE...")
                    .font(.system(size: 52, weight: .bold, design: .default))
                    .foregroundColor(.red)
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                
                
                
                List {
                    Section(header: Text("2025년 05월 24일")) {
                        Text("아 오늘 진짜 짜증나")
                    }
                }
                .frame(width: 352, height: 112)
                .cornerRadius(20)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    HistoryView()
}
