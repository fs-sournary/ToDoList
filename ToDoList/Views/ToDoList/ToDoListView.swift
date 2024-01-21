//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @State private var showNewItem = false
    
    @Bindable private var viewModel: ToDoListViewModel
    
    @FirestoreQuery private var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "\(Constant.FIRESTORE_USERS_COLLECTION)/\(userId)/\(Constant.FIRESTORE_TODOS_COLLECTION)")
        self._viewModel = Bindable(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                    ZStack {
                        NavigationLink(value: item) {
                            EmptyView()
                        }
                        
                        ToDoListItemView(item: item) {
                            viewModel.toggleDone($0)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .swipeActions {
                        Button {
                            viewModel.delete(item.id)
                        } label: {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                        .tint(.red)
                    }
                }
                .listStyle(.plain)
                .navigationDestination(for: ToDoListItem.self) { item in
                    
                }
            }
            .navigationTitle("To do list")
            .toolbar {
                Button {
                    showNewItem = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showNewItem) {
                NewItemView(showNewItem: $showNewItem)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "VJpaOQzOApR4mzaMUUuRbPYrVNA3")
}
