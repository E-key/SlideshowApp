//
//  ExpandViewController.swift
//  SlideshowApp
//
//  Created by 田中陵暉 on 2021/01/28.
//  Copyright © 2021 ryouki.tanaka. All rights reserved.
//

import UIKit

class ExpandViewController: UIViewController {
    
    @IBOutlet weak var expandView: UIImageView!
    
    var expandImage: String = "images[imageNo]"


    override func viewDidLoad() {
        super.viewDidLoad()
        
        expandView.image = UIImage(named: expandImage)
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
