//
//  PageMovieDTO.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 3/06/22.
//

import Foundation

struct PageMovieDTO: Decodable {
    let page: Int?
    let results: [MovieDTO]?
}

struct MovieDTO: Decodable {
    let id: Int?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let vote_average: Double?
    let genres: [GenreMovieDTO]?
}

struct GenreMovieDTO: Decodable {
    let id: Int?
    let name: String?
}


//srgrssfhg • jgvjgkvjyg • ygk jgkj y • uy gukygy
