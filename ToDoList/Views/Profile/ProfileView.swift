//
//  ProfileView.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import SwiftUI

struct ProfileView: View {
    let userId: String
    
    @Bindable private var viewModel: ProfileViewModel
    
    init(userId: String) {
        self.userId = userId
        self._viewModel = Bindable(wrappedValue: ProfileViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 125)
                        .padding(.top, 48)
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.title.bold())
                            Text(user.email)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    
                    Button {
                        viewModel.logout()
                    } label: {
                        Text("Logout")
                    }
                    .padding(.top, 32)
                    
                    Spacer()
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView(userId: "VJpaOQzOApR4mzaMUUuRbPYrVNA3")
}
