//
//  MoviesViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 3/06/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet private weak var tlvMovies: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tlvMovies.dataSource = self
    }
}

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pepito", for: indexPath)
        return cell
    }
}
