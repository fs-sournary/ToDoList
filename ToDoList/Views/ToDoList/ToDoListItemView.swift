//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import SwiftUI

struct ToDoListItemView: View {
    let item: ToDoListItem
    let action: (ToDoListItem) -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                let dueDateText = Date(timeIntervalSince1970: item.dueDate)
                    .formatted(date: .abbreviated, time: .shortened)
                Text(dueDateText)
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                action(item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    let item = ToDoListItem(
        id: "",
        title: "Swift practicing",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false
    )
    return ToDoListItemView(item: item) { _ in }
}
