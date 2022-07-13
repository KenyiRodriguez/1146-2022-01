//
//  ListMoviesSimpleAdapter.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 8/07/22.
//

import UIKit

class ListMoviesSimpleAdapter: NSObject, ListMoviesAdapter {
    
    private unowned let controller: MoviesViewController
    var arrayData = [Any]()
    
    init(controller: MoviesViewController) {
        self.controller = controller
    }
    
    func setTableView(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ListMoviesSimpleAdapter: UITableViewDataSource {
    
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

extension ListMoviesSimpleAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
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
