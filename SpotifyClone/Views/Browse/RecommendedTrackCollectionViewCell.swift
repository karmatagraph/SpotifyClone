//
//  RecommendedTrackCollectionViewCell.swift
//  SpotifyClone
//
//  Created by karma on 8/1/22.
//

import UIKit

class RecommendedTrackCollectionViewCell: UICollectionViewCell {
//    static let identifier = "RecommendedTrackCollectionViewCell"
    
    private let trackCoverImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.numberOfLines = 0
        return label
    }()
    
    private let trackNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(trackCoverImageView)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(trackNameLabel)
        contentView.clipsToBounds = true
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = contentView.height - 20
        // Image
        trackCoverImageView.frame = CGRect(x: 5,
                                           y: 10,
                                           width: imageSize,
                                           height: imageSize)
        
        // Track Name
        trackNameLabel.frame = CGRect(x: trackCoverImageView.right + 20,
                                      y: 10,
                                      width: contentView.width - trackCoverImageView.width - 20,
                                      height: (contentView.height - 20)/2)
//        trackNameLabel.textAlignment = .center
//        trackNameLabel.backgroundColor = .red
        
        // Artist Name
        artistNameLabel.frame = CGRect(x: trackCoverImageView.right + 20,
                                        y: trackNameLabel.bottom + 10,
                                        width: contentView.width - trackCoverImageView.width - 20,
                                        height: (contentView.height - 20)/2)
//        artistNameLabel.textAlignment = .center
//        artistNameLabel.backgroundColor = .blue
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        trackNameLabel.text = nil
        trackCoverImageView.image = nil
        trackNameLabel.text = nil
    }
    
    func configure(with viewModel: RecommendedTrackCellViewModel) {
        trackNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
        trackCoverImageView.sd_setImage(with: viewModel.artworkURL)
    }
    
}
