//
//  ViewController.swift
//  MVP
//
//  Created by Mac on 22.04.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var sliderBoard: UISlider!
    
    var player = AVAudioPlayer()
    let slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // creation of Slider
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 23)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.view.addSubview(slider)
        
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
         
        do {
            let audioPath = Bundle.main.path(forResource: "50cent", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            self.slider.maximumValue = Float(player.duration )
        } catch  {
            print("Error")
        }
        
    }
    // MARK: - Method for changing duration of song
    @objc func changeSlider(sender: UISlider){
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }

    //MARK: - Action for play and pause
    @IBAction func playButton(_ sender: Any) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        self.player.pause()
    }
    
    @IBAction func sliderVolumeAction(_ sender: Any) {
        self.player.volume = self.sliderBoard.value
    }
    
}

