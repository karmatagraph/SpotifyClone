//
//  PlayerViewController.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import UIKit
import SDWebImage

protocol PlayerViewControllerDelegate: AnyObject {
    func didTappedPlayPause()
    func didTappedBack()
    func didTappedNext()
    func didSlidedSlider(_ value: Float)
}

class PlayerViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGreen
        return imageView
    }()
    
    private let controlView: PlayerControlsView = {
        let view = PlayerControlsView()
        return view
    }()
    
    // MARK: - Properties
    weak var datasource: PlayerDataSource?
    weak var delegate: PlayerViewControllerDelegate?
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(controlView)
        configureBarButtons()
        configure()
        controlView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 0,
                                 y: view.safeAreaInsets.top,
                                 width: view.width,
                                 height: view.width)
        controlView.frame = CGRect(x: 5,
                                   y: imageView.bottom + 5,
                                   width: view.width - 10,
                                   height: view.height - imageView.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 5)
    }
    
    // MARK: - Private methods
    private func configure() {
        controlView.configure(with: PlayerControlsViewViewModel(title: datasource?.songName ?? "",
                                                                subtitle: datasource?.subtitle ?? ""))
        imageView.sd_setImage(with: datasource?.imageURL)
    }
    
    private func configureBarButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapAction))
    }
    
    @objc func didTapClose() {
        dismiss(animated: true)
    }
    
    @objc func didTapAction() {
        //
    }
    
}

extension PlayerViewController: PlayerControlsViewDelegate {
    func playerControlsViewDidTapBackButton(_ playerControlView: PlayerControlsView) {
        delegate?.didTappedBack()
    }
    
    func playerControlsViewDidTapPlayPause(_ playerControlView: PlayerControlsView) {
        delegate?.didTappedPlayPause()
    }
    
    func playerControlsViewDidTapNextButton(_ playerControlView: PlayerControlsView) {
        delegate?.didTappedNext()
    }
    
    func playerControlsView(_ playerControlView: PlayerControlsView, didSlideSlider value: Float) {
        delegate?.didSlidedSlider(value)
    }
    
}
