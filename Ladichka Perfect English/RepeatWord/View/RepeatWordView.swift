////
////  RepeatWordView.swift
////  Ladichka Perfect English
////
////  Created by Maksim Kosharny on 12.09.2023.
////

import SwiftUI

struct RepeatWordView: View {
    let user: User
    var repeatView: Int {
        return Int.random(in: 1...3)
        //        return 2
    }
    
    
    var body: some View {
        NavigationStack {
            if repeatView == 1 {
                CorrespondenceView(user: user)
            } else if repeatView == 2 {
                ChooseTheCorrectOptionView(user: user)
            } else {
                SpellingView(user: user)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}
