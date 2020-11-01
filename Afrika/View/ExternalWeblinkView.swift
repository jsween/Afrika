//
//  ExternalWeblinkView.swift
//  Afrika
//
//  Created by Jonathan Sweeney on 11/1/20.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal: Animal
    
    var body: some View {
        Group {
            HStack {
                Image(systemName: "globe")
                Text("wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }//: GROUP
                .foregroundColor(.accentColor)
            }//: HSTACK
        }//: GROUP
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(K.Data.animalsJson)
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
