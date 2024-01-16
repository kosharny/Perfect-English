//
//  Word.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 12.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Word: Identifiable, Hashable, Codable {
    var id: String
    var enEn: String
    var ruRu: String
//    let timestamp: Timestamp
}

extension Word {
    static let MOCK_WORD: [Word] = [Word(id: NSUUID().uuidString, enEn: "apple", ruRu: "яблоко"),
                                    Word(id: NSUUID().uuidString, enEn: "with", ruRu: "с"),
                                    Word(id: NSUUID().uuidString, enEn: "they", ruRu: "они"),
                                    Word(id: NSUUID().uuidString, enEn: "be", ruRu: "быть"),
                                    Word(id: NSUUID().uuidString, enEn: "at", ruRu: "на"),
                                    Word(id: NSUUID().uuidString, enEn: "one", ruRu: "один"),
                                    Word(id: NSUUID().uuidString, enEn: "have", ruRu: "иметь"),
                                    Word(id: NSUUID().uuidString, enEn: "this", ruRu: "это"),
                                    Word(id: NSUUID().uuidString, enEn: "from", ruRu: "из"),
                                    Word(id: NSUUID().uuidString, enEn: "by", ruRu: "от"),
                                    Word(id: NSUUID().uuidString, enEn: "hot", ruRu: "горячий / жарко"),
    ]
}
