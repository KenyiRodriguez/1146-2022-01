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
    
    var listAdapter: ListMoviesAdapter!
    var searchAdapter: SearchMoviesAdapter!
    var presenter: MoviesViewPresenter!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.pullToRefresh(_:)), for: .valueChanged)
        return refreshControl
    }()
}

//MARK: - Ciclo de vida o llamado del usuario
//aca van todos los metodos de ciclo de vida y tambien todos los IBActions
extension MoviesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.willAppear()
    }
    
    @IBAction private func pullToRefresh(_ refreshControl: UIRefreshControl) {
        self.presenter.pullToRefresh()
    }
}

//MARK: - HABILIDADES
extension MoviesViewController {
    
    func addRefreshControl() {
        self.tlvMovies.addSubview(self.refreshControl)
    }
    
    func showLoading(_ isShow: Bool) {
        isShow ? self.refreshControl.beginRefreshing() : self.refreshControl.endRefreshing()
    }
    
    func reloadListData(_ arrayData: [Any]) {
        self.listAdapter.arrayData = arrayData
        self.tlvMovies.reloadData()
    }
    
    func reloadSearchData(_ arrayData: [Movie]) {
        self.searchAdapter.arrayData = arrayData
    }
    
    func setupAdapters() {
        self.tlvMovies.dataSource = self.listAdapter
        self.tlvMovies.delegate = self.listAdapter
        self.srcMovies.delegate = self.searchAdapter
    }
    
    func setResultOfSearchMovies(_ arrayData: [Any]) {
        self.reloadListData(arrayData)
    }
    
    func openDetailMovie(_ movie: Movie) {
        let controller = MovieDetailViewController.buildWithIdMovie(movie.id)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


extension MoviesViewController {
    
    class func buildLocal() -> MoviesViewController {
        
        let storyboard = UIStoryboard(name: "Movie", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "MoviesViewController") as? MoviesViewController else {
            return MoviesViewController()
        }
        
        controller.listAdapter = ListMoviesAdapter(controller: controller)
        controller.searchAdapter = SearchMoviesAdapter(controller: controller)
        controller.presenter = MoviesViewLocalPresenter(controller: controller)
        
        controller.tabBarItem.title = "Favoritos"
        controller.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        controller.tabBarItem.image = UIImage(systemName: "star")
        
        return controller
    }
    
    class func buildOnline() -> MoviesViewController {
        
        let storyboard = UIStoryboard(name: "Movie", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "MoviesViewController") as? MoviesViewController else {
            return MoviesViewController()
        }
        
        controller.listAdapter = ListMoviesAdapter(controller: controller)
        controller.searchAdapter = SearchMoviesAdapter(controller: controller)
        controller.presenter = MoviesViewOnlinePresenter(controller: controller)
        
        controller.tabBarItem.title = "Películas"
        controller.tabBarItem.selectedImage = UIImage(systemName: "square.grid.2x2.fill")
        controller.tabBarItem.image = UIImage(systemName: "square.grid.2x2")
        
        return controller
    }
}
