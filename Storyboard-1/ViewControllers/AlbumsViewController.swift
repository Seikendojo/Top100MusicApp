//
//  AlbumsViewController.swift
//  Storyboard-1
//
//  Created by Seiken Dojo on 2023-03-20.
//

import UIKit

class AlbumsViewController: UIViewController {

    //MARK: IBOutlets]
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    
    var allAlbums: [Album] = []
    
    private var albumsFeedURLString: String {
        "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        getTop100Albums()
    }
    
    //MARK: Fetch Data from API
    
    func getTop100Albums() {
        if let url = URL(string: albumsFeedURLString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
                if error != nil {
                    print("There was an error loading data!")
                } else if data != nil {
                    
                    do {
                        let root = try JSONDecoder().decode([String: AlbumsFeed].self, from: data!)
                        let feed = root["feed"]
                        self?.allAlbums = feed?.results ?? []
                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}

   //MARK: TableView DataSource

extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allAlbums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? AlbumCell else { return UITableViewCell() }
        let album = allAlbums[indexPath.row]
        cell.setupCell(album: album)
        return cell
    }
    
    //MARK: TableView Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "AlbumToDetailVC", sender: indexPath)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AlbumToDetailVC" {
            let indexPath = sender as! IndexPath
            let albumDetailVC = segue.destination as! AlbumDetailsViewController
            let tempAlbum = allAlbums[indexPath.row]
            albumDetailVC.album = tempAlbum
        }
    }
}
