//
//  MovieTableViewCell.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import UIKit

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
        
        self.lblTitle.textColor = Colors.main
        self.lblDescription.textColor = Colors.textGray
        
        self.lblTitle.font = Fonts.regular16
        self.lblDescription.font = Fonts.regular16
    }
    
    public func setupCell(title: String, movieDescription: String, miniatureUrl: String?) {
        self.lblTitle.text = title
        self.lblDescription.text = movieDescription
        // TODO: add kingfisher
    }
}
