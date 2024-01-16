//
//  ContentView.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 12.09.2023.
//

import SwiftUI

struct ContentView: View {
    let user: User
    var repeatView: Int {
//        return Int.random(in: 1...3)
        return 1
    }
    @State private var selectedIndex: Tab = .newWord
    @State private var index: Tab? = nil
    let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        ZStack {
                customTab
                .padding(.top, UIScreen.main.bounds.height/7.9)
            VStack{
                headerView
                Spacer()
            }
            
        }
        .ignoresSafeArea()
    }
}


extension ContentView {
    
    var headerView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .shadow(radius: 6)
            VStack {
                Spacer()
                HStack {
                    Text("Ladichka Perfect English")
                        .padding(.top, 2)
                        .font(Font.custom("paprika", size: 24))
                        .foregroundColor(.pink)
                }
                .padding(.bottom, 12)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/8)
    }
    
    
    var customTab: some View {
        
        ZStack {
            VStack {
                TabView(selection: $selectedIndex) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            switch selectedIndex {
                            case .newWord:
                                NewWordView()
                                    .onAppear {
                                        index = .newWord
                                    }
                            case .wordList:
                                WordListView(user: user)
                                    .onAppear {
                                        index = .wordList
                                    }
                            case .repeatWord:
                                RepeatWordView(user: user)
                                .onAppear {
                                    index = .repeatWord
                                }
                            }
                        }
                        .tag(tab)
                    }
                }
                .onChange(of: selectedIndex) { value in
                    index = value
                    impactGenerator.impactOccurred()
                }
                
            }
            VStack {
                Spacer()
                CustomTabBar(selectedIndex: $selectedIndex)
                    .padding(.bottom, 24)
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

