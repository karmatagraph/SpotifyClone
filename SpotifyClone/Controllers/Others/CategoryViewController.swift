//
//  CategoryViewController.swift
//  SpotifyClone
//
//  Created by karma on 8/5/22.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let category: Category
    
    private let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { _, _ -> NSCollectionLayoutSection in
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .absolute(250)),
                                                       subitem: item,
                                                       count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        return NSCollectionLayoutSection(group: group)
    }))
    
    // MARK: - init
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Properties
    private var playlists: [Playlist] = []
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        view.backgroundColor = .systemBackground
        fetchData(with: category)
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FeaturedPlaylistCollectionViewCell.self, forCellWithReuseIdentifier: FeaturedPlaylistCollectionViewCell.identifier)
    }
    
    private func fetchData(with category: Category) {
        APICaller.shared.getCategoryPlaylist(category: category) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let playlsit):
                    self?.playlists = playlsit
                    self?.collectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = PlaylistViewController(playlist: playlists[indexPath.row])
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedPlaylistCollectionViewCell.identifier, for: indexPath) as? FeaturedPlaylistCollectionViewCell else {
            return UICollectionViewCell()
        }
        let playlist = playlists[indexPath.row]
        cell.configure(with: FeaturedPlaylistCellViewModel(name: playlist.name,
                                                           artworkURL: URL(string: playlist.images.first?.url ?? "" ),
                                                           creatorName: playlist.owner.display_name))
        return cell
    }
    
    
}
