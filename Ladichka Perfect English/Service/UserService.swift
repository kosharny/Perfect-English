//
//  UserService.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 17.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try? snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    static func fetchAllUser(limit: Int? = nil) async throws -> [User] {
        let query = FirestoreConstants.UsersCollection
        if let limit { query.limit(to: limit) }
        let snapshot = try await query.getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
//    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
//        FirestoreConstants.UsersCollection.document(uid).getDocument { snapshot, _ in
//            guard let user = try? snapshot?.data(as: User.self) else { return }
//            completion(user)
//        }
//    }
}

