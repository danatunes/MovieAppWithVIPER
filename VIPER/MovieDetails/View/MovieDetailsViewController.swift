//
//  MovieDetailsMovieDetailsViewController.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController, MovieDetailsViewInput {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textViewDesc: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var output: MovieDetailsViewOutput!
    
    var movie : MovieDetailedModel?{
        didSet{
            updateUI(movie: self.movie!)
        }
    }
//    var movieId : Int = 0
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        ratingView.layer.cornerRadius = 15
        ratingView.layer.masksToBounds = true
    }


    // MARK: MovieDetailsViewInput
    func setupInitialState() {
        
    }
    
    func setMovieDetails(_ movie: MovieDetailedModel) {
        self.movie = movie
    }
    
    func updateUI(movie : MovieDetailedModel){
        
        guard let poster = movie.poster else {
            print("... poster nil")
            return
        }
        
        let url = URL(string: "https://image.tmdb.org/t/p/w300\(poster)")
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
            |> RoundCornerImageProcessor(cornerRadius: 20)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
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
        
        ratingLabel.text = "\(movie.rating)"
//        titleLabel.text = movie.title
//        releaseDate.text = movie.releaseDate
//        textViewDesc.text = movie.description
        titleLabel.text = movie.title
        releaseDate.text = movie.releaseDate
        textViewDesc.text = movie.description
    }
    
}
