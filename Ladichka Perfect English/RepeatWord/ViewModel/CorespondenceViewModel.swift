//
//  CorespondenceViewModel.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 11.10.2023.
//

import Foundation

class CorespondenceViewModel: ObservableObject {
    private let user: User
    @Published var word = Word(id: "", enEn: "", ruRu: "")
    @Published var variant2 = Word(id: "", enEn: "", ruRu: "")
    
    @Published var wordRu = ""
    
    private var chooseVariant: Int {
        return Int.random(in: 1...2)
    }
    
    
    init(user: User) {
        self.user = user
        
        Task {
            try await fetchOneWord()
            try await fetchSecondVariant()
            try await createWordRu()
        }
    }
    
    @MainActor
    func fetchOneWord() async throws {
        self.word = try await WordService.fetchOneWord(uid: user.id)
    }
    
    @MainActor
    func fetchSecondVariant() async throws {
        self.variant2 = try await WordService.fetchOneWord(uid: user.id)
    }
    
    
    @MainActor
    func createWordRu() async throws {
        if chooseVariant == 1 {
            self.wordRu = word.ruRu
        } else {
            self.wordRu = variant2.ruRu
        }
    }
}

