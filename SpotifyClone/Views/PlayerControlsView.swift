//
//  PlayerControlsView.swift
//  SpotifyClone
//
//  Created by karma on 8/10/22.
//

import UIKit

protocol PlayerControlsViewDelegate: AnyObject {
    func PlayerControlsViewDidTapBackButton(_ playerControlView: PlayerControlsView)
    func PlayerControlsViewDidTapPlayPause(_ playerControlView: PlayerControlsView)
    func PlayerControlsViewDidTapNextButton(_ playerControlView: PlayerControlsView)
}

final class PlayerControlsView: UIView {
    
    weak var delegate: PlayerControlsViewDelegate?
    
    private let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .systemGreen
        slider.value = 0.5
        return slider
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight:.semibold )
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight:.regular )
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "backward.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34,weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let forwardButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "forward.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34,weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let playPauseButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "pause.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34,weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupSubviews()
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.frame = CGRect(x: 0,
                                 y: 0,
                                 width: width,
                                 height: 50)
        subtitleLabel.frame = CGRect(x: 0,
                                     y: nameLabel.bottom+10,
                                     width: width,
                                     height: 50)
        volumeSlider.frame = CGRect(x: 10,
                                    y: subtitleLabel.bottom+20,
                                    width: width - 20,
                                    height: 44)
        let buttonSize: CGFloat = 60
        playPauseButton.frame = CGRect(x: (width - buttonSize)/2,
                                       y: volumeSlider.bottom+30,
                                       width: buttonSize,
                                       height: buttonSize)
        backButton.frame = CGRect(x: playPauseButton.left-80,
                                  y: playPauseButton.top, width: buttonSize,
                                  height: buttonSize)
        forwardButton.frame = CGRect(x: playPauseButton.left+80,
                                     y: playPauseButton.top,
                                     width: buttonSize,
                                     height: buttonSize)
        
        
    }
    
    // MARK: - Private Methods
    private func setupSubviews() {
        addSubview(volumeSlider)
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        addSubview(backButton)
        addSubview(forwardButton)
        addSubview(playPauseButton)
        clipsToBounds = true
    }
    
    private func setupButtons() {
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        forwardButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
    }
    
    @objc private func didTapBack() {
        delegate?.PlayerControlsViewDidTapBackButton(self)
    }
    
    @objc private func didTapPlayPause() {
        delegate?.PlayerControlsViewDidTapPlayPause(self)
    }
    
    @objc private func didTapNext() {
        delegate?.PlayerControlsViewDidTapNextButton(self)
    }
    
}
