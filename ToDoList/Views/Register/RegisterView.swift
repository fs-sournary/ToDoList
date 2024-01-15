//
//  RegisterView.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import SwiftUI

struct RegisterView: View {
    @Bindable private var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(.orange)
                        .rotationEffect(Angle(degrees: -15))
                    VStack {
                        Text("Register")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundStyle(.white)
                        Text("Start organizing todos")
                            .font(.system(size: 30))
                            .foregroundStyle(.white)
                    }
                    .padding(.top, 80)
                }
                .frame(width: UIScreen.main.bounds.width * 3, height: 350)
                .offset(y: -150)
                
                // Form
                Form {
                    TextField("Your name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Your email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Create password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    TlButton(title: "Create account", backgroundColor: .green) {
                        viewModel.register()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterView()
}
