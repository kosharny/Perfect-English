//
//  SpellingViewModel.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 11.10.2023.
//

import Foundation

class SpellingViewModel: ObservableObject {
    private let user: User
    @Published var word = Word(id: "", enEn: "", ruRu: "")
    
    init(user: User) {
        self.user = user
        
        Task { try await fetchOneWord() }
    }
    
    @MainActor
    func fetchOneWord() async throws {
        self.word = try await WordService.fetchOneWord(uid: user.id)
    }
}
