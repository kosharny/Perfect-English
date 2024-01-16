//
//  SpellingView.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 14.09.2023.
//

import SwiftUI

struct SpellingView: View {
    let user: User
    @State private var answer = ""
    @StateObject var viewModel: SpellingViewModel
    
    let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: SpellingViewModel(user: user))
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .padding()
                .frame(width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.height*0.7)
                .foregroundColor(Color(.systemGray4))
                .shadow(radius: 6)
            Image("chooseView")
                .resizable()
                .frame(width: 180, height: 180)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 140)
                .padding(.leading, 120)
            
            VStack(spacing: 0) {
                Text(viewModel.word.enEn)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(.white)
                        .shadow(radius: 8)
                    
                    TextField("Answer", text: $answer)
                        .autocapitalization(.none)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .onSubmit {
                            hideKeyboard()
                        }
                }
                .padding(.top, 60)
                .padding(.horizontal, 60)
                
                NavigationLink {
                    if answer.lowercased().trimmingCharacters(in: .whitespaces) == viewModel.word.ruRu.lowercased().trimmingCharacters(in: .whitespaces) {
                        RepeatWordView(user: user)
                    } else {
                        AlertView()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-80, height: UIScreen.main.bounds.height*0.09)
                            .foregroundColor(.black)
                            .shadow(radius: 8)
                        Text("Done")
                            .font(Font.custom("paprika", size: 30))
                            .foregroundColor(.pink)
                    }
                    .padding(.top, 30)
                }
                .onTapGesture {
                    impactGenerator.impactOccurred()
                }
            }
            .padding(.top, 220)
        }
    }
}
