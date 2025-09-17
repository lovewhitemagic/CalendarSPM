//
//   InfoTag.swift
//  CalendarSPM
//
//  Created by HUI on 2025/9/17.
//

import SwiftUI

public struct InfoTag: View {
    let text: String
    let color: Color

    public init(text: String, color: Color) {
        self.text = text
        self.color = color
    }

    public var body: some View {
        Text(text)
            .font(.system(size: 12))
            .foregroundColor(.white)
            .padding(.vertical, 5)
            .frame(width: (UIScreen.main.bounds.width - 6) / 7)
            .background(color)
            .cornerRadius(5)
    }
}
