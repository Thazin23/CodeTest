//
//  DetailViewController.swift
//  CodeTest
//
//  Created by Thazin Nwe on 21/08/2024.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView : UIImageView!
    @IBOutlet var activityIndicator : UIActivityIndicatorView!
    var author: Author!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        if let url = URL(string: author.download_url){
            
                imageView.sd_setImage(with: url, placeholderImage: nil,options: [ .scaleDownLargeImages] ){ (image, error, cacheType, imageURL) in
                    
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                    self.imageView.contentMode = .scaleAspectFit
                }
        }
    }
    



}
