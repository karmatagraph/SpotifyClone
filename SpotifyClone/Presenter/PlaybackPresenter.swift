//
//  PlaybackPresenter.swift
//  SpotifyClone
//
//  Created by karma on 8/9/22.
//

import UIKit
import AVFoundation

protocol PlayerDataSource: AnyObject {
    var songName: String? { get }
    var subtitle: String? { get }
    var imageURL: URL? { get }
}

final class PlaybackPresenter {
    
    static let shared = PlaybackPresenter()
    private init() {}
    
    private var track: AudioTrack?
    private var tracks = [AudioTrack]()
    
    var currentTrack: AudioTrack? {
        if
            let track = track,
            tracks.isEmpty {
            return track
        } else if let player = self.playerQueue, !tracks.isEmpty {
//            let item = player.currentItem
//            let items = player.items()
//            guard let index = items.firstIndex(where: {$0 == item}) else {
//                return nil
//            }
            return tracks[index]
        }
        return nil
    }
    
    var player: AVPlayer?
    var playerQueue: AVQueuePlayer?
    var playerVC: PlayerViewController?
    var index = 0
    
    func startPlayback(from viewcontroller: UIViewController, track: AudioTrack) {
        guard let url = URL(string: track.preview_url ?? "") else {
            return
        }
        player = AVPlayer(url: url)
        player?.volume = 0.2
        
        self.track = track
        self.tracks = []
        let vc = PlayerViewController()
        vc.title = track.name
        vc.datasource = self
        vc.delegate = self
        viewcontroller.present(UINavigationController(rootViewController: vc), animated: true) { [weak self] in
            //start playing the audio
            self?.player?.play()
        }
        self.playerVC = vc
    }
    
    func startPlayback(from viewcontroller: UIViewController, tracks: [AudioTrack]) {
        
        self.tracks = tracks
        self.track = nil
        playerQueue?.volume = 0.2
        self.playerQueue = AVQueuePlayer(items: tracks.compactMap({
            guard let url = URL(string: $0.preview_url ?? "") else { return nil }
            return AVPlayerItem(url: url)
        }))
        self.playerQueue?.play()
        let vc = PlayerViewController()
        vc.datasource = self
        vc.delegate = self
        viewcontroller.present(UINavigationController(rootViewController: vc), animated: true)
        self.playerVC = vc
    }
    
}

extension PlaybackPresenter:PlayerDataSource {

    var songName: String? {
        return currentTrack?.name
    }
    
    var subtitle: String? {
        return currentTrack?.artists?.first?.name
    }
    
    var imageURL: URL? {
        return URL(string: currentTrack?.album?.images.first?.url ?? "")
    }

}

extension PlaybackPresenter: PlayerViewControllerDelegate {
   
    func didTappedPlayPause() {
        if let player = player {
            if player.timeControlStatus == .playing {
                player.pause()
            } else if player.timeControlStatus == .paused {
                player.play()
            }
        } else if let player = playerQueue {
            if player.timeControlStatus == .playing {
                player.pause()
            } else if player.timeControlStatus == .paused {
                player.play()
            }
        }
                    
    }
    
    func didTappedBack() {
        if tracks.isEmpty {
            // Not Playlist or album
            player?.pause()
            player?.play()
        } else if let playerFirstItem = playerQueue?.items().first {
            playerQueue?.pause()
            playerQueue?.removeAllItems()
            playerQueue = AVQueuePlayer(items: [playerFirstItem])
            playerQueue?.play()
            playerQueue?.volume = 0.2
        }
    }
    
    func didTappedNext() {
        if tracks.isEmpty {
            // Not Playlist or album
            player?.pause()
        } else if let player = playerQueue {
            player.advanceToNextItem()
            index += 1
            playerVC?.refreshUI()
        }
    }
    
    func didSlidedSlider(_ value: Float) {
        player?.volume = value
    }
    
}
