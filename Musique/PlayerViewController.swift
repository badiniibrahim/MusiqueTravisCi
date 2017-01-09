//
//  PlayerViewController.swift
//  Musique
//
//  Created by Badini on 06/01/17.
//  Copyright © 2017 Badini. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songTitle: UILabel!
    
    
    var audioPlayer = AVPlayer()
    
    var trackId: Int = 0
    var library = MusicLibrary().library
    var content = String?()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let coverImage = library[trackId]["coverImage"]{
            coverImageView.image = UIImage(named: "\(coverImage).jpg")
        }
        
        songTitle.text = library[trackId]["titre"]
        artistLabel.text = library[trackId]["artist"]

        
    }
    
    func readFile(id :Int) {
    
        let url = "http://localhost:8081/music/"
        let finalUrl = url + "\(id)"
        let playerItem = AVPlayerItem( URL:NSURL( string:finalUrl )! )
        audioPlayer = AVPlayer(playerItem:playerItem)
        audioPlayer.rate = 1.0;
        audioPlayer.play()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func PlayAction(sender: AnyObject) {
        readFile(trackId)
    }
    
    
    
    @IBAction func StopAction(sender: AnyObject) {
        audioPlayer.pause()
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
