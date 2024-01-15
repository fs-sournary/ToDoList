//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

@Observable
class NewItemViewModel {
    var title = ""
    var dueDate = Date()
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty,
              dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
    
    func save() {
        guard canSave else { return }
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let itemId = UUID().uuidString
        let item = ToDoListItem(
            id: itemId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        let db = Firestore.firestore()
        db.collection(Constant.FIRESTORE_USERS_COLLECTION)
            .document(userId)
            .collection(Constant.FIRESTORE_TODOS_COLLECTION)
            .document(itemId)
            .setData(item.asDictionary())
    }
}
