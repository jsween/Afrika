//
//  VideoPlayerView.swift
//  Afrika
//
//  Created by Jonathan Sweeney on 11/1/20.
//
import AVKit
import SwiftUI

struct VideoPlayerView: View {
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
               // Text(videoTitle)
            }
        }
        .overlay(
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(8), alignment: .topLeading
        )//: VSTACK
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
