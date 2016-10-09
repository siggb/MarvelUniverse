//
//  CharacterDetailHeaderView.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/9/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit
import Kingfisher
import PureLayout

class CharacterDetailHeaderView: UIView {

    private let bgImageView = UIImageView()
    private let characterImageView = UIImageView()
    private let titleLabel = UILabel()
    
    init(character: Character) {
        super.init(frame: CGRect.zero)
        locateSubviews()
        titleLabel.text = character.name
        if let imgURL = character.thumbnail?.largeImageURL {
            let imgResource = ImageResource(downloadURL: imgURL)
            characterImageView.kf.setImage(with: imgResource)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func locateSubviews() {
        bgImageView.image = R.image.headerBackground()
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.clipsToBounds = true
        addSubview(bgImageView)
        bgImageView.autoPinEdgesToSuperviewEdges()
        
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.clipsToBounds = true
        characterImageView.layer.cornerRadius = 50
        characterImageView.layer.masksToBounds = true
        addSubview(characterImageView)
        characterImageView.autoAlignAxis(toSuperviewAxis: .vertical)
        characterImageView.autoAlignAxis(.horizontal, toSameAxisOf: self, withOffset: -8)
        characterImageView.autoSetDimensions(to: CGSize(width: 100, height: 100))
        
        titleLabel.font = R.font.tradeGothicLTStdBd2(size: 22)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.white
        addSubview(titleLabel)
        titleLabel.autoPinEdge(.top, to: .bottom, of: characterImageView, withOffset: 8)
        titleLabel.autoSetDimension(.height, toSize: 50, relation: .lessThanOrEqual)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
    }
}
