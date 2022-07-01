//
//  MoviesViewLocalPresenter.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 1/07/22.
//

import Foundation

struct MoviesViewLocalPresenter {
    
    private unowned let controller: MoviesViewController

    private let dataAccess = MovieDA(context: DataManager.current.persistentContainer.viewContext)
    
    init(controller: MoviesViewController) {
        self.controller = controller
    }
    
    private func getAllMovies() {
        
        let arrayResult = self.dataAccess.listAll()
        let arrayData = arrayResult.toMovies
        self.controller.reloadSearchData(arrayData)
        self.controller.reloadListData(arrayData.count == 0 ? ["Aun no tienes favoritos agregados"] : arrayData)
    }
}

//MARK: - Contrapartes
extension MoviesViewLocalPresenter: MoviesViewPresenter {
    
    func didLoad() {
        self.controller.setupAdapters()
    }
    
    func willAppear() {
        self.getAllMovies()
    }
    
    func pullToRefresh() {
        self.getAllMovies()
    }
}
