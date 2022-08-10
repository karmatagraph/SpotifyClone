//
//  PlayerViewController.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import UIKit

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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(controlView)
        configureBarButtons()
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
    func PlayerControlsViewDidTapBackButton(_ playerControlView: PlayerControlsView) {
        <#code#>
    }
    
    func PlayerControlsViewDidTapPlayPause(_ playerControlView: PlayerControlsView) {
        <#code#>
    }
    
    func PlayerControlsViewDidTapNextButton(_ playerControlView: PlayerControlsView) {
        <#code#>
    }
}
