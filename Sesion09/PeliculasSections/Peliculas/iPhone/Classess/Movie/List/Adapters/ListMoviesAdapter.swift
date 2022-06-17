//
//  ListMoviesAdapter.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 17/06/22.
//

import UIKit

class ListMoviesAdapter: NSObject {
    
    private unowned let controller: MoviesViewController
    
    var arrayData = [Any]() {
        didSet {
            var newArray = [[Any]]()
            
            let arrayMessages = self.arrayData.filter({ $0 is String })
            if arrayMessages.count != 0 { newArray.append(arrayMessages) }
            
            let arrayMovies = self.arrayData.filter({ $0 is Movie })
            if arrayMovies.count != 0 { newArray.append(arrayMovies) }
            
            self.arrayToShow = newArray
        }
    }
    
    private var arrayToShow = [[Any]]()
    
    init(controller: MoviesViewController) {
        self.controller = controller
    }
}

extension ListMoviesAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.arrayToShow.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let elementsInSection = self.arrayToShow[section]
        return elementsInSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let elementsInSection = self.arrayToShow[indexPath.section]
        let element = elementsInSection[indexPath.row]
        
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let elementsInSection = self.arrayToShow[section]
        
        if let _ = elementsInSection as? [String] {
            return "Mensajes de error"
        } else if let _ = elementsInSection as? [Movie] {
            return "Todas las películas"
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let elementsInSection = self.arrayToShow[indexPath.section]
        if let objMovie = elementsInSection[indexPath.row] as? Movie {
            self.controller.openDetailMovie(objMovie)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let elementsInSection = self.arrayToShow[indexPath.section]
        
        switch elementsInSection[indexPath.row] {
        case is Movie:
            return UITableView.automaticDimension
        case is String:
            return tableView.frame.height
        default:
            return 0
        }
    }
}
