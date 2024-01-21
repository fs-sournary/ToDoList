//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import FirebaseAuth
import Foundation

@Observable
class LoginViewModel {
    var email = ""
    var password = ""
    var errorMsg: String = ""
    
    func login() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let strongSelf = self else { return }
            strongSelf.errorMsg = error?.localizedDescription ?? ""
        }
    }
    
    private func validate() -> Bool {
        errorMsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty &&
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "Please fill all information"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMsg = "Please enter a valid email"
            return false
        }
        return true
    }
}
