//
//  LoginView.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var showRegistration = false
    
    @Bindable private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(.pink)
                        .rotationEffect(Angle(degrees: 15))
                    
                    VStack {
                        Text("To do list")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundStyle(.white)
                        Text("Get things done")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 80)
                }
                .frame(width: UIScreen.main.bounds.width * 3, height: 350)
                .offset(y: -150)
                
                // Form
                Form {
                    TextField("Email address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    if !viewModel.errorMsg.isEmpty {
                        Text(viewModel.errorMsg)
                    }
                    
                    TlButton(title: "Login", backgroundColor: .blue) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                // Create an account
                VStack {
                    Text("New around here")
                    Button("Create an account") {
                        showRegistration = true
                    }
                }
                
                Spacer()
            }
            .navigationDestination(isPresented: $showRegistration) {
                RegisterView()
            }
        }
    }
}

#Preview {
    LoginView()
}
