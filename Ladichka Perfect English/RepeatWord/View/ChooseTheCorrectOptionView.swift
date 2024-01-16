//
//  chooseTheCorrectOptionView.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 14.09.2023.
//

import SwiftUI

struct ChooseTheCorrectOptionView: View {
    
    let user: User
    @StateObject var viewModel: ChooseTheCorrectOptionViewModel
    
    let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChooseTheCorrectOptionViewModel(user: user))
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .padding()
                .frame(width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.height*0.7)
                .foregroundColor(Color(.systemGray4))
                .shadow(radius: 6)
            Image("stitchLaunch")
                .resizable()
                .frame(width: 310, height: 200)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 120)
                .padding(.leading, 60)
            VStack(spacing: 0) {
                Text(viewModel.word.enEn)
                    .foregroundColor(.black)
                    .font(Font.custom("paprika", size: 38))
                    .padding(.top, 50)
                
                NavigationLink {
                    if viewModel.wordVariant1 == viewModel.word.ruRu {
                       RepeatWordView(user: user)
                    } else {
                        AlertView()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-80, height: UIScreen.main.bounds.height*0.09)
                            .foregroundColor(.pink)
                        Text(viewModel.wordVariant1)
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 40)
                }
                .onTapGesture {
                    impactGenerator.impactOccurred()
                }

                NavigationLink {
                    if viewModel.wordVariant2 == viewModel.word.ruRu {
                       RepeatWordView(user: user)
                    } else {
                        AlertView()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-80, height: UIScreen.main.bounds.height*0.09)
                            .foregroundColor(.pink)
                        Text(viewModel.wordVariant2)
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .onTapGesture {
                    impactGenerator.impactOccurred()
                }
                
                NavigationLink {
                    if viewModel.wordVariant3 == viewModel.word.ruRu {
                       RepeatWordView(user: user)
                    } else {
                        AlertView()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-80, height: UIScreen.main.bounds.height*0.09)
                            .foregroundColor(.pink)
                        Text(viewModel.wordVariant3)
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .onTapGesture {
                    impactGenerator.impactOccurred()
                }
            }
            .padding(.top, 200)
        }
    }
}
