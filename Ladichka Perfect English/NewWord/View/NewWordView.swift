//
//  NewWordView.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 12.09.2023.
//

import SwiftUI

struct NewWordView: View {
    @State private var enEN: String  = ""
    @State private var ruRU: String  = ""
    @StateObject var viewModel = NewWordViewModel()
    
    var body: some View {
        ZStack{
            Image("stitchNewWord")
                .padding(.top, 450)
                .padding(.leading, 200)
            VStack {
                Text("Enter a new word!")
                    .font(Font.custom("paprika", size: 24))
                    .foregroundColor(.black)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(.white)
                        .shadow(radius: 8)
                    TextField("English", text: $enEN)
                        .autocapitalization(.none)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .onSubmit {
                                hideKeyboard()
                            }
                }
                .padding()
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(.white)
                        .shadow(radius: 8)
                    TextField("Translate", text: $ruRU)
                        .autocapitalization(.none)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .onSubmit {
                                hideKeyboard()
                            }
                }
                .padding()
                
                Button {
                    // Adds new word
                    Task {
                        try await viewModel.uploadWord(enEN: enEN, ruRu: ruRU)
                        ruRU = ""
                        enEN = ""
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: UIScreen.main.bounds.height/14)
                            .foregroundColor(.pink)
                            .shadow(radius: 8)
                        Text("Done")
                            .font(Font.custom("paprika", size: 28))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top)
                .padding(.horizontal, 32)
                
                Spacer()
            }
            .padding(.top, 80)
        }
    }
}

struct NewWordView_Previews: PreviewProvider {
    static var previews: some View {
        NewWordView()
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
