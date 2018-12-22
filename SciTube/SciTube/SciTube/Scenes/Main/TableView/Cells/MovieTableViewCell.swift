//
//  MovieTableViewCell.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

final class MovieTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var ivMiniature: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareCell()
    }
    
    private func prepareCell() {
        self.ivMiniature.image = nil
        self.ivMiniature.contentMode = .scaleAspectFit
        
        self.lblTitle.textColor = Colors.main
        self.lblDescription.textColor = Colors.textGray
        
        self.lblTitle.font = Fonts.regular16
        self.lblDescription.font = Fonts.regular16
        
        self.lblTitle.numberOfLines = 0
        self.lblTitle.lineBreakMode = .byWordWrapping
        
        self.lblDescription.numberOfLines = 0
        self.lblDescription.lineBreakMode = .byWordWrapping
    }
    
    public func setupCell(title: String, movieDescription: String, miniatureUrl: URL) {
        self.lblTitle.text = title
        self.lblDescription.text = movieDescription
        Alamofire.request(miniatureUrl).responseImage { [weak self] response in
            self?.ivMiniature.image = response.result.value
        }
    }
}
