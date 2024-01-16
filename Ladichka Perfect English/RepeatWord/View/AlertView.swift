//
//  AlertView.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 11.10.2023.
//

import SwiftUI

struct AlertView: View {
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
                .shadow(radius: 8)
                .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.height*0.18)
            VStack {
                Text("Incorrect answer!")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Ladichka, try again!")
                    .font(.subheadline)
                
                Button {
                    dismiss()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color(.systemGray4))
                            .frame(width: UIScreen.main.bounds.width*0.5, height: UIScreen.main.bounds.height*0.05)
                        Text("OK")
                            .font(Font.custom("paprika", size: 20))
                            .foregroundColor(.pink)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AlertView()
}
