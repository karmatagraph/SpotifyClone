//
//  LibraryToggleView.swift
//  SpotifyClone
//
//  Created by karma on 8/11/22.
//

import UIKit

protocol LibraryToggleViewDelegate: AnyObject {
    func didTapPlaylist(_ toggleView: LibraryToggleView)
    func didTapAlbums(_ toggleView: LibraryToggleView)
}

class LibraryToggleView: UIView {
    
    enum State {
        case playlist
        case album
    }
    
    
    private let playlistButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Playlist", for: .normal)
        return button
    }()
    
    private let albumsButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Albums", for: .normal)
        return button
    }()
    
    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        
        return view
    }()
    
    // MARK: - Properties
    weak var delegate: LibraryToggleViewDelegate?
    var state: State = .playlist
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playlistButton.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        albumsButton.frame = CGRect(x: playlistButton.right, y: 0, width: 100, height: 44)
        layoutIndicator()
    }
    
    // MARK: - Private methods
    private func setupButtons() {
        addSubview(playlistButton)
        addSubview(albumsButton)
        addSubview(indicatorView)
        playlistButton.addTarget(self, action: #selector(didTapPlaylists), for: .touchUpInside)
        albumsButton.addTarget(self, action: #selector(didTapAlbums), for: .touchUpInside)
    }
    
    private func layoutIndicator() {
        switch state {
        case .playlist:
            indicatorView.frame = CGRect(x: 0, y: playlistButton.bottom, width: playlistButton.width, height: 3)
        case .album:
            indicatorView.frame = CGRect(x: playlistButton.width, y: playlistButton.bottom, width: playlistButton.width, height: 3)
        }
    }
    
    func update(for state: State) {
        self.state = state
        UIView.animate(withDuration: 0.2) {
            self.layoutIndicator()
        }
    }
    
    @objc private func didTapPlaylists() {
        state = .playlist
        UIView.animate(withDuration: 0.2) {
            self.layoutIndicator()
        }
        delegate?.didTapPlaylist(self)
    }
    
    @objc private func didTapAlbums() {
        state = .album
        UIView.animate(withDuration: 0.2) {
            self.layoutIndicator()
        }
        delegate?.didTapAlbums(self)
    }

}
