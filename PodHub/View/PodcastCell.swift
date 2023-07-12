//
//  PodcastCell.swift
//  PodHub
//
//  Created by Yamoses on 23/05/2023.
//

import UIKit
import SDWebImage

class PodcastCell : UITableViewCell {
    
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var podcastAuthorLabel: UILabel!
    @IBOutlet weak var episodeCount: UILabel!
    
    var podcast: Podcast! {
        didSet {
            trackNameLabel.text = podcast.trackName
            podcastAuthorLabel.text = podcast.artistName
            episodeCount.text = "\(podcast.trackCount ?? 0) episodes"
            
            guard let url = URL(string: podcast.artworkUrl600 ?? "") else {return}
            podcastImageView.sd_setImage(with: url)
        }
    }
}
