//
//  SearchView.swift
//  Search
//
//  Created by 한빈 on 2022/11/21.
//

import SwiftUI

struct SearchView: View {
    let array = [
        "El", "bin", "iOS", "Xcode", "Swift", "Objective-C",
        "Java", "Python", "Visual", "Studio", "Docker", "React",
        "And", "roid", "Hello", "World", "Standard"
    ]
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                List {
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in Text(searchText)
                    }
                } //리스트의 스타일 수정
                .listStyle(PlainListStyle())
                  //화면 터치시 키보드 숨김
                .onTapGesture {
                    hideKeyboard()
                }
            }
            .navigationBarTitle("Search View")
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

//화면 터치시 키보드 숨김
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
