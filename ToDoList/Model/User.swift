//
//  User.swift
//  ToDoList
//
//  Created by Sournary on 16/01/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let name: String
    let joined: TimeInterval
}
