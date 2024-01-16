//
//  WordListViewModel.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 09.10.2023.
//

import Foundation

class WordListViewModel: ObservableObject {
    private let user: User
    @Published var words = [Word]()
    
    init(user: User) {
        self.user = user
        
        Task { try await fetchWords() }
    }
    
    @MainActor
    func fetchWords() async throws {
        self.words = try await WordService.fetchWord(uid: user.id)
    }
}
