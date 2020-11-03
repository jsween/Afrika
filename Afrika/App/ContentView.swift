//
//  ContentView.swift
//  Afrika
//
//  Created by Jonathan Sweeney on 10/25/20.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode(K.Data.animalsJson)
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var isGridViewActive: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) {animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: LINK
                        }//: LOOP
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: LINK
                            }//: LOOP
                        }//: GRID
                        .padding(10)
                        .animation(.easeIn)
                    }//: SCROll
                }//: CONDITION
            }//: GROUP
            .navigationBarTitle(K.appName, displayMode: .large)
            .toolbar() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        //LIST
                        Button(action: {
                            print("Listview is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        //GRID
                        Button(action: {
                            print("Gridview is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }//: HSTACK
                }//: TOOLBAR ITEM
            }//: TOOLBAR
        }//: NAV
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
