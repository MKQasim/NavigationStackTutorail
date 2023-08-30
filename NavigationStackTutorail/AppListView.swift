//
//  TutorialView.swift
//  demoapp
//
//  Created by KamsQue on 30/08/2023.
//

import SwiftUI

struct TutorialView: View {
  let cities: [String] = ["New York", "London", "Berlin"]
  @State private var navigationStack: [String] = []
  
  var body: some View {
    NavigationStack(path: $navigationStack) {
      ScrollView {
        VStack(spacing: 30) {
//          Step : 1
          ForEach(0..<1) { value in
//            NavigationLink(destination: {
//              TutorialDetailsView(value: value)
//            }, label: {
//              Text("Click me \(value)")
//            })
          

            NavigationLink(destination: Text("Details of \(value)")) {
              Text("destination by String: \(value)")
            }
            
            NavigationLink(value: value) {
              Text("value by Int : \(value)")
            }
            
          }.navigationTitle("City List")
          
          ForEach(cities, id: \.self) { city in
            NavigationLink(destination: Text("Details of \(city)")) {
              Text(city)
            }
          }
//          
          Button("Add to Stack") {
            navigationStack.append(contentsOf: ["Tokyo", "Paris", "Sydney"])
          }
          
        }
        .navigationDestination(for: Int.self) { value in
          TutorialDetailsView(value: value)
        }
        .navigationDestination(for: String.self) { value in
//          TutorialDetailsView(value: value)
          Text("New Screen: \(value)")
        }
      }
    }
  }
}

struct TutorialDetailsView: View {
  let value: Int
  init(value: Int) {
    self.value = value
    print("Init : \(value)")
  }
  var body: some View {
    Text("TutorialDetailsView : \(value)")
  }
}


#Preview {
  TutorialView()
}
