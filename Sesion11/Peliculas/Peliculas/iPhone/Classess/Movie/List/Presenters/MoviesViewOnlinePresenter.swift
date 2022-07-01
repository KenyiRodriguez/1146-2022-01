//
//  MoviesViewOnlinePresenter.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 1/07/22.
//

import Foundation

struct MoviesViewOnlinePresenter {
    
    private unowned let controller: MoviesViewController

    private let webService = MovieWS()
    
    init(controller: MoviesViewController) {
        self.controller = controller
    }
    
    private func getAllMovies() {
        
        self.controller.showLoading(true)
        
        self.webService.getAllMovies { arrayMoviesDTO in
            
            self.controller.showLoading(false)
            let arrayData = arrayMoviesDTO.toMovies
            self.controller.reloadListData(arrayData)
            self.controller.reloadSearchData(arrayData)
        }
    }
}

//MARK: - Contrapartes
extension MoviesViewOnlinePresenter: MoviesViewPresenter {
    
    func didLoad() {
        self.controller.addRefreshControl()
        self.controller.setupAdapters()
        self.getAllMovies()
    }
    
    func willAppear() {
        //EN BLANCO
    }
    
    func pullToRefresh() {
        self.getAllMovies()
    }
}
