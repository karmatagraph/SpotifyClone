//
//  Settings.swift
//  SpotifyClone
//
//  Created by karma on 7/29/22.
//

import Foundation

struct Section {
    let title: String
    let option: [Option]
}

struct Option {
    let title: String
    let handler: (()->())
}
