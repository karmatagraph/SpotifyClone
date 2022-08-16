//
//  LibraryAlbumsViewController.swift
//  SpotifyClone
//
//  Created by karma on 8/11/22.
//

import UIKit

class LibraryAlbumsViewController: UIViewController {
    
    // MARK: - Properties
    var albums = [Album]()
    private let noAlbumsView = ActionLabelView()
//    weak var delegate: SearchResultViewControllerDelegate?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SearchResultSubtitleTableViewCell.self, forCellReuseIdentifier: SearchResultSubtitleTableViewCell.identifier)
        tableView.isHidden = true
        return tableView
    }()
    private var observer: NSObjectProtocol?
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemPink
        setupView()
        fetchData()
        setupTableView()
        setupObserver()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        noAlbumsView.frame = CGRect(x: (view.width-150)/2, y: (view.height-150)/2, width: 150, height: 150)
        noAlbumsView.center = view.center
        tableView.frame = view.bounds
    }
    
    // MARK: - Private Methods
    private func setupView() {
        noAlbumsView.delegate = self
        view.addSubview(noAlbumsView)
        noAlbumsView.configure(with: ActionLabelViewViewModel(text: "You have not saved any albums yet.",
                                                                actionTitle: "Browse"))
    }
    
    @objc private func didTapClose() {
        dismiss(animated: true)
    }
    
    private func setupObserver() {
        observer = NotificationCenter.default.addObserver(forName: .albumSavedNotification,
                                                          object: nil,
                                                          queue: .main,
                                                          using: { notification in
            self.fetchData()
        })
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    private func fetchData() {
        albums.removeAll()
        APICaller.shared.getCurrentUserAlbums {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let model):
                    self?.albums = model.compactMap({$0.album})
                    self?.updateUI()
                }
            }
        }
    }
    
    private func updateUI() {
        if albums.isEmpty {
            // show label
            noAlbumsView.isHidden = false
        } else {
            // show table with the playlistdata
            tableView.reloadData()
            tableView.isHidden = false
            noAlbumsView.isHidden = true
        }
    }
    
}

extension LibraryAlbumsViewController: ActionLabelViewDelegate {
   
    func actionLabelViewDidTapButton(_ actionView: ActionLabelView) {
        // switch tabs
        tabBarController?.selectedIndex = 0
    }
    
}

extension LibraryAlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let album = albums[indexPath.row]
        let vc = AlbumViewController(album: album)
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension LibraryAlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = albums[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultSubtitleTableViewCell.identifier, for: indexPath) as? SearchResultSubtitleTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: SearchResultSubtitleTableViewCellViewModel(title: album.name,
                                                                        subtitle: album.artists.first?.name ?? "-",
                                                                        imageURL: URL(string: album.images.first?.url ?? "") ))
        return cell
    }
}
