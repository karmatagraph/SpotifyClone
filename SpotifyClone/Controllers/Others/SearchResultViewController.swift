//
//  SearchResultViewController.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import UIKit

struct SearchSection {
    let title: String
    let results: [SearchResults]
}

protocol SearchResultViewControllerDelegate: AnyObject {
    func didTapResult(_ result: SearchResults)
    
}

class SearchResultViewController: UIViewController {

    private var sections: [SearchSection] = []
    weak var delegate: SearchResultViewControllerDelegate?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setup() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func update(with results: [SearchResults]) {
        let artists = results.filter({
            switch $0 {
            case .artist: return true
            default: return false
            }
        })
        let albums = results.filter({
            switch $0 {
            case .album: return true
            default: return false
            }
        })
        let playlists = results.filter({
            switch $0 {
            case .playlist: return true
            default: return false
            }
        })
        let tracks = results.filter({
            switch $0 {
            case .track: return true
            default: return false
            }
        })
        self.sections = [
            SearchSection(title: "Artists", results: artists),
            SearchSection(title: "Albums", results: albums),
            SearchSection(title: "Playlists", results: playlists),
            SearchSection(title: "Tracks", results: tracks)
        ]
        tableView.reloadData()
        tableView.isHidden = results.isEmpty
    }
    
}

extension SearchResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let result = sections[indexPath.section].results[indexPath.row]
        delegate?.didTapResult(result)
    }
}

extension SearchResultViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = sections[indexPath.section].results[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        switch result {
        case .artist(let model):
            cell.textLabel?.text = model.name
        case .album(let model):
            cell.textLabel?.text = model.name
        case .playlist(let model):
            cell.textLabel?.text = model.name
        case .track(let model):
            cell.textLabel?.text = (model.name ?? "")
        }
        return cell 
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
}
