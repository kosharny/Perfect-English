//
//  SignUpView.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 15.09.2023.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @State private var confirmPassword: String  = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("signUp")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Create your account!")
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
                    TextField("Full name", text: $viewModel.fullname)
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
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(.white)
                        .shadow(radius: 8)
                    SecureField("Confirm password", text: $confirmPassword)
                        .autocapitalization(.none)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                .padding()
                
                Button {
                    Task { try await viewModel.createUser() }
//                    ContentView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: UIScreen.main.bounds.height/14)
                            .foregroundColor(.pink)
                            .shadow(radius: 8)
                        Text("Sign Up")
                            .font(Font.custom("paprika", size: 28))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top)
                .padding(.horizontal, 32)
                
                NavigationLink {
                    
                } label: {
                    HStack {
                        Text("Do you already have an account?")
                            .foregroundColor(.pink)
                        Text("Sign in!")
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
