//
//  PlaybackPresenter.swift
//  SpotifyClone
//
//  Created by karma on 8/9/22.
//

import UIKit

final class PlaybackPresenter {
    
    static func startPlayback(from viewcontroller: UIViewController, track: AudioTrack) {
        let vc = PlayerViewController()
        vc.title = track.name
        viewcontroller.present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    static func startPlayback(from viewcontroller: UIViewController, tracks: [AudioTrack]) {
        let vc = PlayerViewController()
        viewcontroller.present(UINavigationController(rootViewController: vc), animated: true)
    }
    
}
