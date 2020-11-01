//
//  CoverImageView.swift
//  Afrika
//
//  Created by Jonathan Sweeney on 10/31/20.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    private let coverImages: [CoverImage] = Bundle.main.decode(K.Data.coversJson)
    // MARK: - BODY
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - PREVIEW

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
