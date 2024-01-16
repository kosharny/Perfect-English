//
//  SignInView.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 15.09.2023.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("ladichka")
                    .padding()
                Text("Login to your account!")
                    .font(Font.custom("paprika", size: 24))
                    .foregroundColor(.black)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(.white)
                        .shadow(radius: 8)
                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                .padding()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(.white)
                        .shadow(radius: 8)
                    SecureField("Password", text: $viewModel.password)
                        .autocapitalization(.none)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                .padding()
                
                Button {
                    Task { try await viewModel.login() } 
//                    ContentView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: UIScreen.main.bounds.height/14)
                            .foregroundColor(.pink)
                            .shadow(radius: 8)
                        Text("Sign In")
                            .font(Font.custom("paprika", size: 28))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top)
                .padding(.horizontal, 32)
                
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.pink)
                        Text("Sign up!")
                            .foregroundColor(.pink)
                            .fontWeight(.bold)
                    }
                    .padding()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
//        .navigationDestination(isPresented: $viewModel.didAuthUser) {
//            AccountView()
//        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
