//
//  ChooseTheCorrectOptionViewModel.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 11.10.2023.
//

import Foundation

class ChooseTheCorrectOptionViewModel: ObservableObject {
    private let user: User
    @Published var word = Word(id: "", enEn: "", ruRu: "")
    @Published var variant2 = Word(id: "", enEn: "", ruRu: "")
    @Published var variant3 = Word(id: "", enEn: "", ruRu: "")
    
    @Published var wordVariant1 = ""
    @Published var wordVariant2 = ""
    @Published var wordVariant3 = ""
    
    private var chooseVariant: Int {
        return Int.random(in: 1...3)
    }
    
    init(user: User) {
        self.user = user
        
        Task {
            try await fetchOneWord()
            try await fetchSecondVariant()
            try await fetchThridVariant()
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
    func fetchThridVariant() async throws {
        self.variant3 = try await WordService.fetchOneWord(uid: user.id)
    }
    
    @MainActor
    func createWordRu() async throws {
        if chooseVariant == 1 {
            self.wordVariant1 = word.ruRu
            self.wordVariant2 = variant2.ruRu
            self.wordVariant3 = variant3.ruRu
        } else if chooseVariant == 2 {
            self.wordVariant1 = variant2.ruRu
            self.wordVariant2 = word.ruRu
            self.wordVariant3 = variant3.ruRu
        } else {
            self.wordVariant1 = variant3.ruRu
            self.wordVariant2 = word.ruRu
            self.wordVariant3 = variant2.ruRu
        }
    }
}
