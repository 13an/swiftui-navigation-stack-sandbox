//
//  NavigationStack_01.swift
//  NavigationStackSandbox
//
//  Created by 13an on 2023/07/24.
//

import SwiftUI

struct NavigationStack01View: View {
    
    @State private var items = [
        Item(number: "01"),
        Item(number: "02"),
        Item(number: "03"),
        Item(number: "04"),
        Item(number: "05"),
        Item(number: "06")
    ]

    var body: some View {
        NavigationStack {
            List(items) { item in
                NavigationLink(item.number, value: item)
            }
            .navigationDestination(for: Item.self, destination: { item in
                NavigationStack01DetailView(item: item)
            })
            .navigationTitle("NavigationStack")
        }
    }
}

//
struct Item: Identifiable, Hashable {
    var id = UUID()
    let number: String
}

//

struct NavigationStack01DetailView: View {
    var item: Item
    
    var body: some View {
        Text("get this number: \(item.number)")
    }
}

struct NavigationStack01View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack01View()
    }
}
