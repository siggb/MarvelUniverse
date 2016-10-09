//
//  CharactersListCell.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/3/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit
import Kingfisher

class CharactersListCell: UITableViewCell {
    
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var maskImageView: UIImageView!
    @IBOutlet var characterLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        characterLabel?.font = R.font.tradeGothicLTStdBd2(size: 16)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        maskImageView?.image = selected ? R.image.cellPhotoMaskSel() : R.image.cellPhotoMask()
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        maskImageView?.image = highlighted ? R.image.cellPhotoMaskSel() : R.image.cellPhotoMask()
    }
    
    func configure(item: Character?) {
        if let imgURL = item?.thumbnail?.smallImageURL {
            let imgResource = ImageResource(downloadURL: imgURL)
            characterImageView?.kf.setImage(with: imgResource)
        }
        characterLabel?.text = item?.name
    }
}
