//
//  CustomToolBar.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 12.09.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case newWord
    case wordList
    case repeatWord
}

struct CustomTabBar: View {
    @Binding var selectedIndex: Tab
    
    var body: some View {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    HStack {
                        Image("\(tab)")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .scaleEffect(selectedIndex == tab ? 1.2 : 1.0)
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.1)) {
                                    selectedIndex = tab
                                }
                            }
                    }
                    Spacer()
                }
            }
            .frame(width: UIScreen.main.bounds.width*0.91, height: UIScreen.main.bounds.width/6)
            .background(.pink)
            .cornerRadius(16)
            .shadow(radius: 6)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedIndex: .constant(.newWord))
    }
}

