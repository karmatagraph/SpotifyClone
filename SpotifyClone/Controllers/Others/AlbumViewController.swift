//
//  AlbumViewController.swift
//  SpotifyClone
//
//  Created by karma on 8/3/22.
//

import UIKit

class AlbumViewController: UIViewController {
    
    private let album: Album

    init(album: Album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        title = album.name
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Private methods
    private func fetchData() {
        APICaller.shared.getAlbumDetails(for: album) { [weak self] result in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error)
            }
        }
    }

}
