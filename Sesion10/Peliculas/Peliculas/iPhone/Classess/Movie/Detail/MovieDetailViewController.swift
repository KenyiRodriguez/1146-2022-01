//
//  MovieDetailViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 24/06/22.
//

import UIKit
import Alamofire

class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var scrollContent: UIScrollView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblGenres: UILabel!
    @IBOutlet private weak var lblOverview: UILabel!
    @IBOutlet private weak var lblReleaseDate: UILabel!
    @IBOutlet private weak var imgMovie: UIImageView!
    @IBOutlet private weak var imgMovieBackground: UIImageView!
    @IBOutlet private var arrayStars: [UIImageView]!
    
    var idMovie: Int!
    
    @IBAction private func clickBtnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateData(_ movie: Movie) {
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgMovie.layer.cornerRadius = 10
        self.getDetail()
    }
    
    private func getDetail() {
        
        let webService = MovieWS()
        
        self.showLoading(true)
        webService.getDetailById(self.idMovie) { movieDTO in
            
            self.showLoading(false)
            self.updateData(movieDTO.toMovie)
            
        } error: { errorMessage in
            
            self.showLoading(true)
            print(errorMessage)
        }
    }
    
    private func showLoading(_ isLoading: Bool) {
        self.scrollContent.isHidden = isLoading
    }
}

extension MovieDetailViewController {
    
    class func buildWithIdMovie(_ idMovie: Int) -> MovieDetailViewController {
        
        let storyboard = UIStoryboard(name: "Movie", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
        controller?.idMovie = idMovie
        
        return controller ?? MovieDetailViewController()
    }
}
