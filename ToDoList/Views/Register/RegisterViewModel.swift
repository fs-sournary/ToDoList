//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

@Observable
class RegisterViewModel {
    var name = ""
    var email = ""
    var password = ""
    
    func register() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let strongSelf = self else { return }
            guard let userId = result?.user.uid else { return }
            strongSelf.insertUser(userId)
        }
    }
    
    private func insertUser(_ id: String) {
        let user = User(id: id, email: email, name: name, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(user.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty &&
                !email.trimmingCharacters(in: .whitespaces).isEmpty &&
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        return true
    }
}
