//
//  RegistrationViewModel.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 17.09.2023.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
