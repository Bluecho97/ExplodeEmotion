//
//  HistoryCell.swift
//  ExplodeEmotion
//
//  Created by  Lucid on 5/24/25.
//

import SwiftUI

struct HistoryCell: View {
    
    var historyData: HistoryData
    
    var body: some View {
        List {
            Section(header: Text(historyData.date)) {
                Text(historyData.emotion)
            }
        }
        .frame(width: 352, height: 112)
        .cornerRadius(20)
    }
}
