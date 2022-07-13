//
//  Movie.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 3/06/22.
//

import Foundation

struct Movie {
    let id: Int
    let overview: String
    let posterPath: String
    let releaseDate: Date?
    let title: String
    let voteAverage: Int
    let genres: [String]
    
    var genresFormat: String {
        self.genres.joined(separator: "  •  ")
    }
    
    var releaseDateFormat: String {
        
        guard let releaseDate = self.releaseDate else {
            return "Próximamente"
        }
        
        //Viernes 3 de Junio del 2022
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE dd 'de' MMMM 'del' YYYY"
        dateFormatter.locale = Locale(identifier: "es_pe")
        return dateFormatter.string(from: releaseDate)
    }
    
    var urlImage: String {
        return "https://image.tmdb.org/t/p/w500" + self.posterPath
    }
    
    init(dto: MovieDTO) {
        self.id = dto.id ?? 0
        self.overview = dto.overview ?? "--"
        self.posterPath = dto.poster_path ?? ""
        self.title = dto.title ?? "--"
        self.voteAverage = Int(dto.vote_average ?? 0)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "es_pe")
        self.releaseDate = dateFormatter.date(from: dto.release_date ?? "")
        
        let genresDTO = dto.genres ?? []
        self.genres = genresDTO.map({ $0.name ?? "" })
    }
    
    init(favorite: FavoriteMovie) {
        self.id = Int(favorite.id)
        self.overview = ""
        self.posterPath = favorite.posterPath ?? ""
        self.title = favorite.title ?? ""
        self.voteAverage = Int(favorite.voteAverage)
        self.releaseDate = favorite.releaseDate
        self.genres = []
    }
}

extension MovieDTO {
    var toMovie: Movie {
        return Movie(dto: self)
    }
}

extension FavoriteMovie {
    var toMovie: Movie {
        return Movie(favorite: self)
    }
}

extension Array where Element == FavoriteMovie {
    var toMovies: [Movie] {
        return self.map({ $0.toMovie })
    }
}

extension Array where Element == MovieDTO {
    
    var toMovies: [Movie] {
        return self.map({ $0.toMovie })
    }
    
//    var toMovies: [Movie] {
//        var arrayMovies = [Movie]()
//
//        for dto in self {
//            arrayMovies.append(dto.toMovie)
//        }
//
//        return arrayMovies
//    }
}
