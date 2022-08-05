//
//  SearchViewController.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import UIKit

class SearchViewController: UIViewController {

    let searchController: UISearchController = {
        let vc = UISearchController(searchResultsController: SearchResultViewController())
        vc.searchBar.placeholder = "Songs, Artists, Albums"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
    }()
    
    private let collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                                    collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: {_,_ -> NSCollectionLayoutSection? in
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2,
                                                     leading: 7,
                                                     bottom: 2,
                                                     trailing: 7)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .absolute(150)),
                                                       subitem: item,
                                                       count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                     leading: 0,
                                                     bottom: 10,
                                                     trailing: 0)
        return NSCollectionLayoutSection(group: group)
    }))
    
    private var categories: [Category] = []
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        setup()
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    // MARK: - Private methods
    private func setup() {
        setupCollectionView()
    }
    
    private func fetchData() {
        APICaller.shared.getCategories { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let categories):
                    let category = categories.first!
                    self?.categories = categories
                    self?.collectionView.reloadData()
                    APICaller.shared.getCategoryPlaylist(category: category) { [weak self] result in
                        switch result {
                        case .success(let playlist):
                            print(playlist)
                        case .failure(let error):
                            print(error)
                        }
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard
            let resultController = searchController.searchResultsController as? SearchResultViewController,
            let query = searchController.searchBar.text,
            !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        // result controller.update(with: results)
        // Perform Search
        
    }
    
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let category = categories[indexPath.row]
        let vc = CategoryViewController(category: category)
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: CategoryCollectionViewCellViewModel(title: categories[indexPath.row].name,
                                                                 artworkURL: URL(string: categories[indexPath.row].icons.first?.url ?? "")))
        return cell
    }
    
}
