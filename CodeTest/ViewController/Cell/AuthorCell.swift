//
//  AuthorCell.swift
//  CodeTest
//
//  Created by Thazin Nwe on 20/08/2024.
//

import Foundation
import UIKit
import SDWebImage

class AuthorCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configCell(author: Author, targetSize: CGSize){
        
        if let url = URL(string: "\(Constant.getPhotoUrl)/\(author.id)/\(Int(targetSize.width)*2)/\(Int(targetSize.height)*2)"){
                imageView.sd_setImage(with: url, placeholderImage: nil,options: [ .continueInBackground, .scaleDownLargeImages] ){ (image, error, cacheType, imageURL) in
                    self.imageView.image = image
                    self.imageView.contentMode = .scaleAspectFit
                }
            
           
        }
        
    }
}
