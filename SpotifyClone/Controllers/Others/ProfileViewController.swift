//
//  ProfileViewController.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .systemBackground
        APICaller.shared.getCurrentUserProfile { result in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
