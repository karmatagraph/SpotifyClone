//
//  NewReleaseCollectionViewCell.swift
//  SpotifyClone
//
//  Created by karma on 8/1/22.
//

import UIKit
import SDWebImage

class NewReleaseCollectionViewCell: UICollectionViewCell {
    
//    static let identifier = "NewReleaseCollectionViewCell"
    
    private let albumCoverImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private let numberOfTracksLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .thin)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(albumCoverImageView)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(numberOfTracksLabel)
        contentView.clipsToBounds = true
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = contentView.height - 10
        let albumLabelSize = albumNameLabel.sizeThatFits(CGSize(width: contentView.width - imageSize - 10,
                                                                height: contentView.height-10))
        artistNameLabel.sizeToFit()
        numberOfTracksLabel.sizeToFit()
        
        
        albumCoverImageView.frame = CGRect(x: 5,
                                           y: 5,
                                           width: imageSize,
                                           height: imageSize)
        
        let albumLabelHeight = min(70,albumLabelSize.height)
        albumNameLabel.frame = CGRect(x: albumCoverImageView.right + 10,
                                       y: 5,
                                      width: contentView.width - imageSize - 10,
                                       height: albumLabelHeight)
//        albumNameLabel.backgroundColor = .red
        
        artistNameLabel.frame = CGRect(x: albumCoverImageView.right + 10,
                                       y: albumNameLabel.bottom + 5,
                                       width: contentView.width - albumCoverImageView.right - 5,
                                       height: 30)
//        artistNameLabel.backgroundColor = .blue
        
        numberOfTracksLabel.frame = CGRect(x: albumCoverImageView.right + 10,
                                           y: contentView.bottom - 35,
                                           width: numberOfTracksLabel.width,
                                           height: 30)
//        numberOfTracksLabel.backgroundColor = .yellow
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumNameLabel.text = nil
        artistNameLabel.text = nil
        numberOfTracksLabel.text = nil
        albumCoverImageView.image = nil
    }
    
    func configure(with viewModel: NewReleasesCellViewModel) {
        albumNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
        numberOfTracksLabel.text = "Tracks: \(viewModel.numberOfTracks)"
        albumCoverImageView.sd_setImage(with: viewModel.artworkURL)
    }
    
}
