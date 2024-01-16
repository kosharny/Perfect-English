//
//  User.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 17.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    let id: String
    
    var firstName: String {
        let formatter = PersonNameComponentsFormatter ( )
        let components = formatter.personNameComponents(from: fullname)
        return components?.givenName ?? fullname
    }
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static let MOCK_USER = User(fullname: "Bruce Wayne", email: "batman@gmail.com", id: NSUUID().uuidString)
}

