//
//  TlButton.swift
//  ToDoList
//
//  Created by sangvd on 16/01/2024.
//

import SwiftUI

struct TlButton: View {
    let title: String
    var textColor: Color = .white
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(textColor)
            }
        }
    }
}

#Preview {
    TlButton(title: "Register", textColor: .white, backgroundColor: .blue) {
        // Action here
    }
}
