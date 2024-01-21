//
//  ContentView.swift
//  ToDoList
//
//  Created by Sournary on 15/01/2024.
//

import SwiftUI

struct ContentView: View {
    @Bindable private var viewModel = ContentViewModel()
    
    var body: some View {
        if !viewModel.userId.isEmpty {
            TabView {
                ToDoListView(userId: viewModel.userId)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ProfileView(userId: viewModel.userId)
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
