//
//  ContentViewModel.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 17.09.2023.
//

import Foundation
import Firebase
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var cancellabeles = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        setupSubscribers()
    }
    
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellabeles)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellabeles)
    }
}




//import Firebase
//import Combine
//
//class ContentViewModel: ObservableObject {
//    @Published var userSession: FirebaseAuth.User?
//    
//    private var cancellables = Set<AnyCancellable>()
//    
//    init() {
//        setupSubscribers()
//    }
//    
//    private func setupSubscribers() {
//        AuthService.shared.$userSession.sink { [weak self] userSessionFromAuthService in
//            self?.userSession = userSessionFromAuthService
//        }.store(in: &cancellables)
//    }
//}
