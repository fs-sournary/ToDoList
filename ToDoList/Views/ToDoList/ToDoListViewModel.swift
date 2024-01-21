//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import FirebaseFirestore
import Foundation

@Observable
class ToDoListViewModel {
    let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(_ id: String) {
        let db = Firestore.firestore()
        db.collection(Constant.FIRESTORE_USERS_COLLECTION)
            .document(userId)
            .collection(Constant.FIRESTORE_TODOS_COLLECTION)
            .document(id)
            .delete()
    }
    
    func toggleDone(_ item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        let db = Firestore.firestore()
        db.collection(Constant.FIRESTORE_USERS_COLLECTION)
            .document(userId)
            .collection(Constant.FIRESTORE_TODOS_COLLECTION)
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
