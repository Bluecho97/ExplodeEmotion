//
//  NetworkRequest.swift
//  ExplodeEmotion
//
//  Created by  Lucid on 5/24/25.
//

import SwiftUI

struct APIModel : Codable, Hashable {
    var id: Int?
    let name: String
    let age: Int
    let part: String
}

enum BaseURL : String {
    case baseUrl = "/* 여기 서버 주소 */"
}

struct NetworkRequest: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NetworkRequest()
}
