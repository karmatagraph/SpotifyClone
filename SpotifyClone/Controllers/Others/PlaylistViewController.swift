//
//  PlaylistViewController.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import UIKit

class PlaylistViewController: UIViewController {

    private let playlist: Playlist

    init(playlist: Playlist) {
        self.playlist = playlist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        title = playlist.name
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Private methods
    private func fetchData() {
        APICaller.shared.getPlaylistDetails(for: playlist) { [weak self] result in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
