//
//  NavigationStack02View.swift
//  NavigationStackSandbox
//
//  Created by 13an on 2023/07/26.
//

import SwiftUI

struct NavigationStack02View: View {
    
    @State private var animals = [
        Animal(name: "Lion", habitat: "Africa"),
        Animal(name: "Nihon-Zaru", habitat: "Japan"),
        Animal(name: "Byson", habitat: "America"),
        Animal(name: "Giraffe", habitat: "Africa"),
        Animal(name: "Tiger", habitat: "China"),
        Animal(name: "Penguin", habitat: "Antarctic"),
    ]
    
    
    var body: some View {
        NavigationStack {
            List(animals) { animal in
                NavigationLink(animal.name, value: animal)
            }
            .navigationDestination(for: Animal.self, destination: { animal in
                NavigationStack02DetailView(animal: animal)
            })
            .navigationTitle("Animals")
        }
    }
}

struct Animal: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var habitat: String
}

struct NavigationStack02DetailView: View {
    var animal: Animal
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Animal Name")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.gray)
            Text("\(animal.name)")
                .font(.largeTitle)
                .fontWeight(.black)
            Text("Habitat")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.gray)
            Text("\(animal.habitat)")
                .font(.headline)
                .fontWeight(.medium)
        }
    }
}

struct NavigationStack02View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack02View()
    }
}
