//
//  EpisodesController.swift
//  PodHub
//
//  Created by Yamoses on 12/07/2023.
//

import UIKit

class EpisodesController: UITableViewController  {
    
    fileprivate let identifier = "CellID"
    
    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        setupTableView()
    }
    
    
    
    struct Episode {
        let title: String?
    }
    
    let episodes = [
        Episode(title: "First episode"),
        Episode(title: "Second episode"),
        Episode(title: "Third episode")
    ]
    
    //Mark:- Setups
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.tableFooterView = UIView()
    }
    
    //MARK:- TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let episode = self.episodes[indexPath.row].title
        cell.textLabel?.text = episode
        return cell
    }
}











