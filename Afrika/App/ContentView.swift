//
//  ContentView.swift
//  Afrika
//
//  Created by Jonathan Sweeney on 10/25/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        // MARK: - PROPERTIES
        let animals: [Animal] = Bundle.main.decode(K.Data.animalsJson)
        
        // MARK: - BODY
        
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animals) {animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalListItemView(animal: animal)
                    }//: LINK
                }
            }//: LIST
            .navigationBarTitle(K.appName, displayMode: .large)
        }//: NAV
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
