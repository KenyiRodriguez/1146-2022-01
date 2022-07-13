//
//  MovieDetailViewPresenter.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 8/07/22.
//

import Foundation

//MARK: - Propiedades
class MovieDetailViewPresenter {
    
    private unowned let controller: MovieDetailViewController
    private let idMovie: Int
    private var movie: Movie?
    
    init(controller: MovieDetailViewController, idMovie: Int) {
        self.controller = controller
        self.idMovie = idMovie
    }
}

//MARK: - Contrapartes
extension MovieDetailViewPresenter {
    func didLoad() {
        self.controller.setupStyle()
        self.setAsFavorite()
        self.getDetail()
    }
    
    func backController() {
        self.controller.backController()
    }
    
    func addToFavorite() {
        
        let dataAccess = MovieDA(context: DataManager.current.persistentContainer.viewContext)
        
        if self.isFavorite {
            dataAccess.delete(self.idMovie)
            DataManager.current.saveContext()
            self.controller.setupFavoriteStyle(false)
            
        } else {
            
            guard let movie = self.movie else { return }
            dataAccess.add(movie)
            DataManager.current.saveContext()
            self.controller.setupFavoriteStyle(true)
        }
    }
}

//MARK: - Habilidades
extension MovieDetailViewPresenter {
    
    var isFavorite: Bool {
        let dataAccess = MovieDA(context: DataManager.current.persistentContainer.viewContext)
        let isFavorite = dataAccess.getByID(Int32(self.idMovie)) != nil
        return isFavorite
    }
    
    private func getDetail() {
        
        let webService = MovieWS()
        
        self.controller.showLoading(true)
        webService.getDetailById(self.idMovie) { movieDTO in
            
            let movie = movieDTO.toMovie
            self.controller.showLoading(false)
            self.controller.updateData(movie)
            self.movie = movie
            
        } error: { errorMessage in
            
            self.controller.showLoading(true)
            print(errorMessage)
        }
    }

    private func setAsFavorite() {
        self.controller.setupFavoriteStyle(self.isFavorite)
    }
}
