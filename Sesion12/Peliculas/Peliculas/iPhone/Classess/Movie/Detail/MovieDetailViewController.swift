//
//  MovieDetailViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 24/06/22.
//

import UIKit
import Alamofire

//MARK: - Propiedades
class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var scrollContent: UIScrollView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblGenres: UILabel!
    @IBOutlet private weak var lblOverview: UILabel!
    @IBOutlet private weak var lblReleaseDate: UILabel!
    @IBOutlet private weak var imgMovie: UIImageView!
    @IBOutlet private weak var imgMovieBackground: UIImageView!
    @IBOutlet private weak var btnFavorite: UIButton!
    @IBOutlet private var arrayStars: [UIImageView]!
    
    private var presenter: MovieDetailViewPresenter!
}

//MARK: - Ciclo de vida o llamado del usuario
//aca van todos los metodos de ciclo de vida y tambien todos los IBActions
extension MovieDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad()
    }
}

//MARK: - LLamado del usuario
extension MovieDetailViewController {
    
    @IBAction private func clickBtnBack(_ sender: UIButton) {
        self.presenter.backController()
    }
    
    @IBAction private func clickBtnAddFavorite(_ sender: UIButton) {
        self.presenter.addToFavorite()
    }
}

//MARK: - HABILIDADES
extension MovieDetailViewController {
    
    func setupFavoriteStyle(_ isFavorite: Bool) {
        let image = isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        self.btnFavorite.setImage(image, for: .normal)
    }
    
    func backController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateData(_ movie: Movie) {
        
        self.lblTitle.text = movie.title
        self.lblReleaseDate.text = movie.releaseDateFormat
        self.lblGenres.text = movie.genresFormat
        self.lblOverview.text = movie.overview
        
        for (index, imgStar) in self.arrayStars.enumerated() {
            imgStar.image = index < movie.voteAverage ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        }
        
        let request = AF.request(movie.urlImage)
        request.response { dataResponse in
            guard let data = dataResponse.data else { return }
            let image = UIImage(data: data)
            self.imgMovie.image = image
            self.imgMovieBackground.image = image
        }
    }
    
    func setupStyle() {
        self.imgMovie.layer.cornerRadius = 10
    }
    
    func showLoading(_ isLoading: Bool) {
        self.scrollContent.isHidden = isLoading
        self.btnFavorite.isHidden = isLoading
    }
}

extension MovieDetailViewController {
    
    class func buildWithIdMovie(_ idMovie: Int) -> MovieDetailViewController {
        
        let storyboard = UIStoryboard(name: "Movie", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else {
            return MovieDetailViewController()
        }
        
        controller.presenter = MovieDetailViewPresenter(controller: controller, idMovie: idMovie)
        
        return controller
    }
}
