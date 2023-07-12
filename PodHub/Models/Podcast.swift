//
//  Podcast.swift
//  PodHub
//
//  Created by Yamoses on 24/04/2023.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String?
}
