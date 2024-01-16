//
//  LoginViewModel.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 17.09.2023.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
