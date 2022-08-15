//
//  LibraryPlaylistViewController.swift
//  SpotifyClone
//
//  Created by karma on 8/11/22.
//

import UIKit

class LibraryPlaylistViewController: UIViewController {
        
    // MARK: - Properties
    var playlists = [Playlist]()
    private let noPlaylistView = ActionLabelView()
    public var selectionHandler: ((Playlist)-> Void)?
//    weak var delegate: SearchResultViewControllerDelegate?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SearchResultSubtitleTableViewCell.self, forCellReuseIdentifier: SearchResultSubtitleTableViewCell.identifier)
        tableView.isHidden = true
        return tableView
    }()

    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemPink
        setupView()
        fetchData()
        setupTableView()
        setupSelection()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        noPlaylistView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        noPlaylistView.center = view.center
        tableView.frame = view.bounds
    }
    
    // MARK: - Private Methods
    private func setupView() {
        noPlaylistView.delegate = self
        view.addSubview(noPlaylistView)
        noPlaylistView.configure(with: ActionLabelViewViewModel(text: "You Don't have any playlist created",
                                                                actionTitle: "Create"))
    }
    
    private func setupSelection() {
        if selectionHandler != nil {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapClose))
        }
    }
    
    @objc private func didTapClose() {
        dismiss(animated: true)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    private func fetchData() {
        APICaller.shared.getCurrentUserPlaylists {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let model):
                    self?.playlists = model
                    self?.updateUI()
                }
            }
        }
    }
    
    private func updateUI() {
        if playlists.isEmpty {
            // show label
            noPlaylistView.isHidden = false
        } else {
            // show table with the playlistdata
            tableView.reloadData()
            tableView.isHidden = false
            noPlaylistView.isHidden = true
        }
    }
    
    func showCreatePlaylistAlert() {
        let alert = UIAlertController(title: "New Playlist",
                                      message: "Enter name for the playlist",
                                      preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Playlist name ..."
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { _  in
            guard let field = alert.textFields?.first,
                  let text = field.text,
                  !text.trimmingCharacters(in: .whitespaces).isEmpty
            else {
                return
            }
            APICaller.shared.createPlaylists(with: text) { success in
                if success {
                    // refresh playlist ui
                    self.fetchData()
                } else {
                    print("failed to create playlist")
                }
            }
        }))
        present(alert, animated: true)
    }
}

extension LibraryPlaylistViewController: ActionLabelViewDelegate {
   
    func actionLabelViewDidTapButton(_ actionView: ActionLabelView) {
        // show creationg ui
        showCreatePlaylistAlert()
//        delegate?.didTapResult(<#T##result: SearchResults##SearchResults#>)
    }
    
}

extension LibraryPlaylistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selected = playlists[indexPath.row]
        guard selectionHandler == nil else {
            selectionHandler?(selected)
            dismiss(animated: true)
            return
        }
        let vc = PlaylistViewController(playlist: selected)
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.isOwner = true
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension LibraryPlaylistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playlist = playlists[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultSubtitleTableViewCell.identifier, for: indexPath) as? SearchResultSubtitleTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: SearchResultSubtitleTableViewCellViewModel(title: playlist.name,
                                                                        subtitle: playlist.owner.display_name,
                                                                        imageURL: URL(string: playlist.images.first?.url ?? "") ))
        return cell
    }
}
