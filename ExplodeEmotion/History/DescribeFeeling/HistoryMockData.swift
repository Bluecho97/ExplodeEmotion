//
//  HistoryMockData.swift
//  ExplodeEmotion
//
//  Created by  Lucid on 5/24/25.
//

import SwiftUI

struct HistoryData: Identifiable {
    var id = UUID()
    var date: String
    var emotion: String
}

extension HistoryData {
    static let modeling: [HistoryData] = [
        HistoryData(date: "2025년 05월 24일", emotion: "아 오늘 진짜 짜증나"),
    ]
}
