//
//  ListMoviesAdapter.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 17/06/22.
//

import UIKit

class ListMoviesAdapter: NSObject {
    
    private unowned let controller: MoviesViewController
    var arrayData = [Any]()
    
    init(controller: MoviesViewController) {
        self.controller = controller
    }
}

extension ListMoviesAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let element = self.arrayData[indexPath.row]
        
        if let movie = element as? Movie {
            return MovieTableViewCell.buildIn(tableView, indexPath: indexPath, movie: movie)
            
        } else if let errorMessage = element as? String {
            return ErrorTableViewCell.buildIn(tableView, indexPath: indexPath, errorMessage: errorMessage)
            
        } else {
            return UITableViewCell()
        }
    }
}

extension ListMoviesAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let objMovie = self.arrayData[indexPath.row] as? Movie {
            self.controller.openDetailMovie(objMovie)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch self.arrayData[indexPath.row] {
        case is Movie:
            return UITableView.automaticDimension
        case is String:
            return tableView.frame.height
        default:
            return 0
        }
    }
}
