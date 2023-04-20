//
//  PodcastsController.swift
//  PodHub
//
//  Created by Yamoses on 24/04/2023.
//

import UIKit
import Alamofire

class PodcastsController: UITableViewController, UISearchBarDelegate{
    
    
    let cellID = "podcast"
    
    var podcasts = [
        Podcast(trackName: "Fluid mechanic", artistName: "Yamusa Dalhatu"),
        Podcast(trackName: "Optics", artistName: "Carl Sagan"),
        Podcast(trackName: "Astrophysics for dummies", artistName: "Niel Degrasse Tyson")
    ]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
    }
    
    private func setupTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        AF.request(url).response { [unowned self] responseData in
            if let err = responseData.error {
                print("Failed to establish connection", err)
                return
            }
            
            guard let data = responseData.data else {return}
            
            do {
                let searchResult = try JSONDecoder().decode(Search.self, from: data)
                print("Result count: ",searchResult.resultCount)
                self.podcasts = searchResult.results
                self.tableView.reloadData()
            } catch let decodeerror {
                print("Failed to decode", decodeerror.localizedDescription)
            }
        }
    }

    //MARK:- TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let podcast = podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.trackName ?? "")\n\(podcast.artistName ?? "")"
        cell.textLabel?.numberOfLines = -1
        cell.imageView?.image = UIImage(named: "appicon")
        
        return cell
    }
}
