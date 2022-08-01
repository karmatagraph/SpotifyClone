//
//  HomeViewController.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Browse"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
        fetchData()
    }
    
    private func fetchData() {
        APICaller.shared.getNewReleases { [weak self] result in
            switch result{
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
        
        APICaller.shared.getFeaturedPlaylist { [weak self] result in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - Private methods
    @objc func didTapSettings() {
        let vc = SettingsViewController()
        vc.title = "Settings"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
