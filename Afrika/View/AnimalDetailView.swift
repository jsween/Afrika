//
//  AnimalDetailView.swift
//  Afrika
//
//  Created by Jonathan Sweeney on 10/31/20.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: Animal
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor
                                    .frame(height: 6)
                                    .offset(y: 24))
                // HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                // GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                // FACTS
                
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsertFactView(animal: animal)
                }
                .padding(.horizontal)

                // DESCRIPTION
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                // MAP
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsertMapView()
                }
                .padding(.horizontal)
                // LINK
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
            }// Vstack
            .navigationBarTitle("Learn about the \(animal.name)", displayMode: .inline)
        }//: Scroll
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(K.Data.animalsJson)
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
        .previewDevice("iPhone 11 Pro")
    }
}
