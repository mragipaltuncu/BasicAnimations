//
//  ViewController.swift
//  Animations
//
//  Created by Mehmet Ragıp Altuncu on 17/01/16.
//  Copyright © 2016 MehmetAltuncu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var counter = 1
    var timer = NSTimer()
    var isAnimating = true
    
    @IBOutlet weak var alienImage: UIImageView!
    
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        if isAnimating {
            timer.invalidate()
            isAnimating = false
            
        }else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            isAnimating = true
        }
        
    
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)

    
    }
    
    func doAnimation () {
        
        if counter == 5 {
            counter = 1
        }else {
            
            counter++
        }
        
        alienImage.image = UIImage(named: "frame\(counter).png")
        
    }

    
    override func viewDidLayoutSubviews() {
        
        alienImage.center = CGPointMake(alienImage.center.x - 400, alienImage.center.y)
    
    }

    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { () -> Void in
            self.alienImage.center = CGPointMake(self.alienImage.center.x + 400, self.alienImage.center.y)
        }
        
        
    
    }
    
}

