//
//  NewWordViewModel.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 09.10.2023.
//

import Foundation
import Firebase

class NewWordViewModel: ObservableObject {
    func uploadWord(enEN: String, ruRu: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let newWordRef = Firestore.firestore().collection("users").document(uid).collection("words").document()
        let newWord = Word(id: newWordRef.documentID, enEn: enEN, ruRu: ruRu)
        
        guard let encodedNewWord = try? Firestore.Encoder().encode(newWord) else { return }
        
        try await newWordRef.setData(encodedNewWord)
    }
}
