//
//  VideoModel.swift
//  Afrika
//
//  Created by Jonathan Sweeney on 11/1/20.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
