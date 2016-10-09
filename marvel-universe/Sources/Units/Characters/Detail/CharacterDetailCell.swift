//
//  CharacterDetailCell.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/10/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

class CharacterDetailCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var sectionImageView: UIImageView?
    @IBOutlet var descriptionLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.text = "INFORMATION"
        titleLabel?.font = R.font.tradeGothicLTStdBd2(size: 18)
        descriptionLabel?.preferredMaxLayoutWidth = UIScreen.main.bounds.width - 36
        descriptionLabel?.font = R.font.tradeGothicLTStd(size: 16)
        sectionImageView?.image = R.image.sectionBackground()
    }
    
    func configure(item: Character?) {
        descriptionLabel?.text = item?.description
    }
}
