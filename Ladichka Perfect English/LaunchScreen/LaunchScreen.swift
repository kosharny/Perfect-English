//
//  LaunchScreen.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 12.09.2023.
//

import SwiftUI

struct LaunchScreen: View {
    
    @StateObject var viewModel = ContentViewModel()
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var offsetHealthy: CGFloat = -120
    @State private var offsetLife: CGFloat = 120
    @State private var offsetEnglish: CGFloat = -120
    @State private var offsetFlag: CGFloat = 120
    
    @State private var offsetStitch: CGFloat = 120
    let impactGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        if isActive {
            Group {
                if viewModel.userSession == nil {
                    SignInView()
//                        .environmentObject(registrationViewModel)
                } else if let currentUser = viewModel.currentUser {
                    ContentView(user: currentUser)
                }
//                if viewModel.userSession != nil {
//                    ContentView(user: viewModel.currentUser)
//                } else {
//                    SignInView()
//                }
            }
            
        } else {
            ZStack {
                Color(.white)
                Image("stitchLaunch")
                    .resizable()
                    .opacity(0.2)
                VStack {
                    Image("ladichka")
                        .resizable()
                        .frame(width: 320, height: 320)
                    HStack{
                        Text("Ladichka")
                        //                            .padding(.top)
                            .font(Font.custom("paprika", size: 40))
                            .foregroundColor(.pink)
                            .offset(x: offsetHealthy, y: 0)
                        
                        Text("Perfect")
                            .padding(.top, 40)
                            .font(Font.custom("paprika", size: 40))
                            .foregroundColor(.pink)
                            .offset(x: offsetLife, y: 0)
                    }
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.3)) {
                            self.offsetLife = 0
                            self.offsetHealthy = 0
                        }
                    }
                    HStack{
                        Text("English")
                            .padding(.top, 40)
                            .font(Font.custom("paprika", size: 40))
                            .foregroundColor(.pink)
                            .offset(x: offsetEnglish, y: 0)
                        
                        Image("english")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .offset(x: offsetFlag, y: 0)
                    }
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.6)) {
                            self.offsetEnglish = 0
                            self.offsetFlag = 0
                        }
                    }
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.3)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                        impactGenerator.impactOccurred()
                    }
                }
            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}


