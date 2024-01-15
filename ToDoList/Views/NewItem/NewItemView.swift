//
//  NewItemView.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import SwiftUI

struct NewItemView: View {
    @Binding var showNewItem: Bool
    @State private var isShowAlert = false
    
    @Bindable private var viewModel = NewItemViewModel()
    
    var body: some View {
        VStack {
            Text("New item")
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 48)
            
            Form {
                TextField(String(localized: "Title"), text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker(String(localized: "Due date"), selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TlButton(title: "Save", backgroundColor: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        showNewItem = false
                    } else {
                        isShowAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $isShowAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please enter valid information")
                )
            }
            
            Spacer()
        }
    }
}

#Preview {
    NewItemView(showNewItem: .constant(false))
}
