//
//  MovieCVCell.swift
//  VIPER
//
//  Created by Магжан Бекетов on 03.06.2021.
//

import UIKit
import Kingfisher

class MovieCVCell: UICollectionViewCell {
    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var nameOfMovie: UILabel!
    @IBOutlet weak var image: UIImageView!
    public static let identifier = String(describing: MovieCVCell.self)
    public static let nib = UINib(nibName: identifier, bundle: nil)
    
    public var genres = [Genres.Genre]()
    
    public var movie : MovieModel.Movie? {
        didSet{
            if let movie = movie{

                DispatchQueue.main.async { [weak self] in
                    var genreString = ""
                    
                    self?.nameOfMovie.text = movie.title
                    self?.genres.forEach { (genre) in
                        movie.genres.forEach { (id) in
                            if genre.id == id{
                                genreString += "\(genre.name), "
                            }
                        }
                    }
                    genreString += "."
                    self?.genre.text = genreString
                    
                }
                if let poster = movie.poster{
                    let url = URL(string: "https://image.tmdb.org/t/p/w300\(poster)")
                    let processor = DownsamplingImageProcessor(size: image.bounds.size)
                        |> RoundCornerImageProcessor(cornerRadius: 20)
                    image.kf.indicatorType = .activity
                    image.kf.setImage(
                        with: url,
                        placeholder: UIImage(named: "placeholderImage"),
                        options: [
                            .processor(processor),
                            .scaleFactor(UIScreen.main.scale),
                            .transition(.fade(3)),
                            .cacheOriginalImage
                        ])
                    {
                        result in
                        switch result {
                        case .success(let value):
                            print("Task done for: \(value.source.url?.absoluteString ?? "")")
                        case .failure(let error):
                            print("Job failed: \(error.localizedDescription)")
                        }
                    }
                    
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
    }

}
