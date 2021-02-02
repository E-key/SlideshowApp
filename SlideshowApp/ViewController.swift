//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 田中陵暉 on 2021/01/28.
//  Copyright © 2021 ryouki.tanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
        
    
    let images = ["image_1.png", "image_2.png", "image_3.png"]
    var imageNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: images[imageNo])
    }
    
    @IBAction func next(_ sender: Any) {
        imageNo += 1
        if imageNo == 3 {
            imageNo = 0
        }
        
        imageView.image = UIImage(named: images[imageNo])

    }
    
    @IBAction func back(_ sender: Any) {
        imageNo -= 1
        if imageNo == -1 {
            imageNo = 2
        }
        
        imageView.image = UIImage(named: images[imageNo])

    }
    
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    @objc func slideShow() {
        imageNo += 1
        if imageNo == 3 {
            imageNo = 0
        }
        
        imageView.image = UIImage(named: images[imageNo])
    }
    
    @IBAction func startStop(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideShow), userInfo: nil, repeats: true)
            startStopButton.setTitle("停止", for: .normal)
            nextButton.isEnabled = false
            backButton.isEnabled = false
        } else if timer != nil {
            timer.invalidate()
            timer = nil
            startStopButton.setTitle("再生", for: .normal)
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let expandViewController:ExpandViewController = segue.destination as! ExpandViewController
        expandViewController.expandImage = images[imageNo]
        if timer != nil {
            timer.invalidate()
            timer = nil
            startStopButton.setTitle("再生", for: .normal)
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }


}

