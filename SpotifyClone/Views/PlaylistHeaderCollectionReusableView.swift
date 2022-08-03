//
//  PlaylistHeaderCollectionReusableView.swift
//  SpotifyClone
//
//  Created by karma on 8/3/22.
//

import UIKit
import SDWebImage

final class PlaylistHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "PlaylistHeaderCollectionReusableView"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let ownerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    private let playlistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = height/1.8
        playlistImageView.frame = CGRect(x: (width - imageSize)/2,
                                         y: 20,
                                         width: imageSize,
                                         height: imageSize)
        
        nameLabel.frame = CGRect(x: 10,
                                 y: playlistImageView.bottom,
                                 width: width-20,
                                 height: 44)
        descriptionLabel.frame = CGRect(x: 10,
                                        y: nameLabel.bottom,
                                        width: width-20,
                                        height: 44)
        ownerLabel.frame = CGRect(x: 10,
                                  y: descriptionLabel.bottom,
                                  width: width-20,
                                  height: 44)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        addSubview(nameLabel)
        addSubview(ownerLabel)
        addSubview(descriptionLabel)
        addSubview(playlistImageView)
    }
    
    func configure(with viewModel: PlaylistHeaderViewViewModel) {
        nameLabel.text = viewModel.name
        ownerLabel.text = viewModel.ownerName
        descriptionLabel.text = viewModel.description
        playlistImageView.sd_setImage(with: viewModel.artworkURL)
    }
    
}
