//
//  MoviesViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 3/06/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet private weak var tlvMovies: UITableView!
    @IBOutlet private weak var srcMovies: UISearchBar!
    
    lazy var listAdapter = ListMoviesAdapter(controller: self)
    lazy var searchAdapter = SearchMoviesAdapter(controller: self)
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.pullToRefresh(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tlvMovies.addSubview(self.refreshControl)
        self.setupAdapters()
        self.getAllMovies()
    }
    
    @objc private func pullToRefresh(_ refreshControl: UIRefreshControl) {
        self.getAllMovies()
    }
    
    private func getAllMovies() {
        
        let ws = MovieWS()
        
        self.refreshControl.beginRefreshing()
        
        ws.getAllMovies { arrayMoviesDTO in
            
            self.refreshControl.endRefreshing()
            let arrayData = arrayMoviesDTO.toMovies
            self.listAdapter.arrayData = arrayData
//            self.listAdapter.arrayData.append("mensaje de prueba 1")
//            self.listAdapter.arrayData.append("mensaje de prueba 2")
            self.searchAdapter.arrayData = arrayData
            self.tlvMovies.reloadData()
        }
    }
    
    private func setupAdapters() {
        self.tlvMovies.dataSource = self.listAdapter
        self.tlvMovies.delegate = self.listAdapter
        self.srcMovies.delegate = self.searchAdapter
    }
    
    func setResultOfSearchMovies(_ arrayData: [Any]) {
        self.listAdapter.arrayData = arrayData
        self.tlvMovies.reloadData()
    }
    
    func openDetailMovie(_ movie: Movie) {
        print("abrir el detalle de la película: \(movie.title)")
    }
}
