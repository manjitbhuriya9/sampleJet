//
//  ArticleTableViewCell.swift
//  JetTravelDemo
//
//  Created by Organization on 04/07/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    //User Outlets
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var userAvatar: UIImageView!
    
    //Article Outlets
    @IBOutlet weak var articleCreatedAt: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleURL: UILabel!
    @IBOutlet weak var articleLikes: UILabel!
    @IBOutlet weak var articleComments: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
