//
//  ArticleTableViewCell.swift
//  JetTravelDemo
//
//  Created by Organization on 04/07/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {
    
    //User Outlets
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserdesignation: UILabel!
    @IBOutlet weak var imgUserAvatar: UIImageView!
    
    //Article Outlets
    @IBOutlet weak var lblArticleCreatedAt: UILabel!
    @IBOutlet weak var lblArticleTitle: UILabel!
    @IBOutlet weak var lblArticleDescription: UILabel!
    @IBOutlet weak var lblArticleURL: UILabel!
    @IBOutlet weak var lblArticleLikes: UILabel!
    @IBOutlet weak var lblArticleComments: UILabel!
    @IBOutlet weak var imgArticleImage: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgUserAvatar.layer.cornerRadius = 15.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ articleViewModel: ArticleViewModel) {
        //self.articleCreatedAt.text = articleViewModel.createdAt
        self.lblArticleDescription.text = articleViewModel.content
        self.lblArticleTitle.text = articleViewModel.title
        self.lblArticleURL.text = articleViewModel.url
        self.lblArticleLikes.text = "\(articleViewModel.likes) Likes"
        self.lblArticleComments.text = "\(articleViewModel.comments) Comments"
        self.imgArticleImage.sd_setImage(with: URL(string: articleViewModel.image), placeholderImage: UIImage(named: "jet2logo.png"))
        
        self.lblUserName.text = articleViewModel.name
        self.lblUserdesignation.text = articleViewModel.designation
        self.imgUserAvatar.sd_setImage(with: URL(string: articleViewModel.avatar), placeholderImage: UIImage(named: "jet2logo.png"))
        
    }

}
