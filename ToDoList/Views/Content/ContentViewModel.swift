//
//  ContentViewModel.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import FirebaseAuth
import Foundation

@Observable
class ContentViewModel {
    var userId = ""
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let strongSelf = self else { return }
            strongSelf.userId = user?.uid ?? ""
        }
    }
    
    var isSigned: Bool {
        Auth.auth().currentUser != nil
    }
}
