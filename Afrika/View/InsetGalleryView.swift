//
//  InsetGalleryView.swift
//  Afrika
//
//  Created by Jonathan Sweeney on 10/31/20.
//

import SwiftUI

struct InsetGalleryView: View {
    let animal: Animal
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }//: LOOP
            }//: HSTACK
        }//: SCROLL
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(K.Data.animalsJson)
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
