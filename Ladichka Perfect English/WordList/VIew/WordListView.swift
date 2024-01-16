//
//  WordListView.swift
//  Ladichka Perfect English
//
//  Created by Maksim Kosharny on 12.09.2023.
//

import SwiftUI

struct WordListView: View {
    @State private var searchText = ""
    @StateObject var viewModel: WordListViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: WordListViewModel(user: user))
    }
    
    var searchResults: [Word] {
           if searchText.isEmpty {
               return viewModel.words
           } else {
               return viewModel.words.filter { $0.enEn.lowercased().contains(searchText.lowercased()) }
           }
       }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Your dictionary!")
                        .font(Font.custom("paprika", size: 24))
                        .foregroundColor(.black)
                    Image("wordList1")
                        .resizable()
                        .frame(width: 100, height: 80)
                }
                
                ScrollView {
                    LazyVStack {
                        ForEach(searchResults) { array in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.pink)
                                Text(array.enEn)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal)
                                Spacer()
                                Text(array.ruRu)
                                    .font(.title3)
                            }
                            .padding()
                            .frame(height: 45)
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search")
            .onAppear {
                UISearchBar.appearance().tintColor = .systemPink
            }
        }
    }
}

