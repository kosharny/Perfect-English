//
//  FirestoreConstants.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 17.09.2023.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let UsersCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}
