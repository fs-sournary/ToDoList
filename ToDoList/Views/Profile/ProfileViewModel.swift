//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

@Observable
class ProfileViewModel {
    let userId: String
    
    var user: User?
    
    init(userId: String) {
        self.userId = userId
        fetchUser()
    }
    
    private func fetchUser() {
        let db = Firestore.firestore()
        db.collection(Constant.FIRESTORE_USERS_COLLECTION)
            .document(userId)
            .getDocument { [weak self] snapShot, error in
                guard let strongSelf = self else { return }
                guard let data = snapShot?.data() else { return }
                strongSelf.user = User(
                    id: data["id"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0.0
                )
            }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
