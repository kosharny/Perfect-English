//
//  СorrespondenceView.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 14.09.2023.
//

import SwiftUI

struct CorrespondenceView: View {
    let user: User
    @StateObject var viewModel: CorespondenceViewModel
    
    let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: CorespondenceViewModel(user: user))
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .padding()
                .frame(width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.height*0.7)
                .foregroundColor(.pink)
                .shadow(radius: 6)
            Image("corView")
                .resizable()
                .frame(width: 200, height: 150)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 140)
                .padding(.leading, 120)
            VStack {
                Text(viewModel.word.enEn)
                    .foregroundColor(.white)
                    .font(Font.custom("paprika", size: 38))
                Text(viewModel.wordRu)
                    .font(.title)
                
                HStack {
                    NavigationLink {
                        if viewModel.wordRu == viewModel.word.ruRu {
                            AlertView()
                        } else {
                            RepeatWordView(user: user)
                        }
                    } label: {
                        ZStack{
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.pink)
                        }
                    }
                    .onTapGesture {
                        impactGenerator.impactOccurred()
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        if viewModel.wordRu != viewModel.word.ruRu {
                            AlertView()
                        } else {
                            RepeatWordView(user: user)
                        }
                    } label: {
                        ZStack{
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.pink)
                        }
                    }
                    .onTapGesture {
                        impactGenerator.impactOccurred()
                    }
                }
                .padding(.top, 100)
                .padding(.horizontal, 80)
            }
            .padding(.top, 250)
            
        }
    }
}

