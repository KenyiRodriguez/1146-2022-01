//
//  ListMoviesAdapter.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 17/06/22.
//

import UIKit

protocol ListMoviesAdapter {
    var arrayData: [Any] { get set }
    func setTableView(_ tableView: UITableView)
}
