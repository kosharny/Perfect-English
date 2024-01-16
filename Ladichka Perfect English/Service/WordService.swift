//
//  WordService.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 09.10.2023.
//

import Firebase

struct WordService {
//    private static let wordCollection = Firestore.firestore().collection("words")
    static func fetchWord(uid: String) async throws -> [Word] {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).collection("words").getDocuments()
        let words = try snapshot.documents.compactMap({ try $0.data(as: Word.self) })
        
        return words
    }
    
    static func fetchOneWord(uid: String) async throws -> Word {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).collection("words").getDocuments()
        let words = try snapshot.documents.compactMap({ try $0.data(as: Word.self) })
        let indexCount = words.count - 1
        let index = Int.random(in: 0...indexCount)
        let word = words[index]
        return word
    }
}
