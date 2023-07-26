//
//  ParentNavigationView.swift
//  NavigationStackSandbox
//
//  Created by 13an on 2023/07/24.
//

import SwiftUI

struct ParentNavigationView: View {
    @StateObject private var hapticEngine = HapticEngine()
    
    @State private var isActive = false
    @State private var selectedAnimalName: String?

    let animals = ["🐱", "🐶", "🐥"]
    
    @State private var path = [String]()

    var body: some View {
        NavigationStack(path: $path) {
           List {
                ForEach(animals, id: \.self) { animal in
                    Button {
                        hapticEngine.playHapticsFile(named: "light")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            // 実際にはサーバから取得
                            let name = ["🐱": "ねこ", "🐶": "いぬ"]
                            guard let name = name[animal] else {
                                return
                            }
                            path.append(name)
                        }
                    } label: {
                        Text("\(animal) ここをタップしてね")
                    }
                }
            }
           .navigationDestination(for: String.self) { name in
               VStack {
                   Text(name)
                   Button("back to top") {
                       hapticEngine.playHapticsFile(named: "light")
                       path.removeAll()
                   }
                   Button("go 🐱") {
                       hapticEngine.playHapticsFile(named: "light")
                       path.append("ねこ")
                   }
               }
           }
        }
    }
}

struct ParentNavigationView_Previews: PreviewProvider {
    static var previews: some View {
            ParentNavigationView()
    }
}
