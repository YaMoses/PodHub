//
//  Search.swift
//  PodHub
//
//  Created by Yamoses on 24/04/2023.
//

import Foundation

struct Search: Decodable{
    let resultCount: Int
    let results: [Podcast]
}
