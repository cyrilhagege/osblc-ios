//
//  ViewController.swift
//  OSBLC
//
//  Created by HAGEGE Cyril on 02/10/2018.
//  Copyright © 2018 HAGEGE Cyril. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isPlaying: Bool = true
    var timer: Timer!
    var iteration: Int = 0
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playButtonTouched(_ sender: Any) {
        handleSound()
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    @objc func setRandomBackgroundColor() {
        let colors = [
            hexStringToUIColor(hex: "#f442e8"),
            hexStringToUIColor(hex: "#fc8719"),
            hexStringToUIColor(hex: "#f6f918"),
            hexStringToUIColor(hex: "#13f9c4"),
        ]
        self.view.backgroundColor = colors[iteration]
        iteration = iteration + 1
        if (iteration > 3) { iteration = 0 }
    }
    
    // or for Swift 4
    @objc func viewTouched(_ sender:UITapGestureRecognizer){
        handleSound()
    }
    
    func handleSound() {
        NSLog("Button touched")
        if (isPlaying) {
            playButton.setTitle("Play", for: UIControl.State.normal)
            pauseSound()
            isPlaying = false
        } else {
            playButton.setTitle("Pause", for: UIControl.State.normal)
            playSound()
            isPlaying = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleSound()
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.viewTouched(_:)))
        self.view.addGestureRecognizer(gesture)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setRandomBackgroundColor), userInfo: nil, repeats: true)
        self.setRandomBackgroundColor()

    }


}

