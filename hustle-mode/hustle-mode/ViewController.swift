//
//  ViewController.swift
//  hustle-mode
//
//  Created by Ahmed Elbasha on 9/28/17.
//  Copyright © 2017 Ahmed Elbasha. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var onlabel: UILabel!
    @IBOutlet weak var hustleLabel: UILabel!
    
    var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay();
        }catch let error as NSError {
            print(error.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func powerButtonPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.5, animations: {
            self.rocket.frame = CGRect(x: 0, y: 20, width: 414, height: 736)
        }, completion: {(finished) in
            self.onlabel.isHidden = false
            self.hustleLabel.isHidden = false
        })
        
    }
    
}

