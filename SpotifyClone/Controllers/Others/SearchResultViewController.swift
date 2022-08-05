//
//  SearchResultViewController.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import UIKit

class SearchResultViewController: UIViewController {

    private var results: [SearchResults] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func update(with results: [SearchResults]) {
        self.results = results
    }
    
}
