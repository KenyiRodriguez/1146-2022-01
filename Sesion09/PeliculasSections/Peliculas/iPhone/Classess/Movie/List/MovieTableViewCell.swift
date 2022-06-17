//
//  MovieTableViewCell.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 10/06/22.
//

import UIKit
import Alamofire

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblReleaseDate: UILabel!
    @IBOutlet private weak var imgMovie: UIImageView!
    @IBOutlet private var arrayStars: [UIImageView]!
    
    func updateData(_ movie: Movie) {
            
        self.animateAppear()
        
        self.lblTitle.text = movie.title
        self.lblReleaseDate.text = movie.releaseDateFormat
        
        for (index, imgStar) in self.arrayStars.enumerated() {
            imgStar.image = index < movie.voteAverage ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        }
        
        let request = AF.request(movie.urlImage)
        request.response { dataResponse in
            guard let data = dataResponse.data else { return }
            self.imgMovie.image = UIImage(data: data)
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.imgMovie.layer.cornerRadius = 10
    }
    
    private func animateAppear() {
        
        self.alpha = 0
        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1
            self.transform = .identity
        }
    }
}

extension MovieTableViewCell {
    
    class func buildIn(_ tableView: UITableView, indexPath: IndexPath, movie: Movie) -> MovieTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        cell?.updateData(movie)
        return cell ?? MovieTableViewCell()
    }
}
