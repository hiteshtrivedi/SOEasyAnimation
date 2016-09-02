//
//  SecondViewController.swift
//  SOEasyAnimation
//
//  Created by Hitesh on 9/2/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var viewAnimation : UIView!
    var iRow = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        viewAnimation.hidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        viewAnimation.hidden = false
        switch iRow {
        case 0:
            SOAnimation.sharedInstance.animationScaleEffects(viewAnimation, aniTime: 2.0)
            break
        case 1:
            SOAnimation.sharedInstance.performTranslationAnimationInViewFromTop(viewAnimation)
        case 2:
            SOAnimation.sharedInstance.performTranslationAnimationInViewFromBottom(viewAnimation)
            break
        case 3:
            SOAnimation.sharedInstance.performBounceLeftAnimationOnView(viewAnimation, duration: 0.5, delay: 0) {
                
            }
        case 4:
            SOAnimation.sharedInstance.performBounceRightAnimationOnView(viewAnimation, duration: 0.5, delay: 0)
            break
        case 5:
            SOAnimation.sharedInstance.simpleAnimationFrame(viewAnimation)
        case 6:
            SOAnimation.sharedInstance.simpleAnimationFadeIn(viewAnimation)
            break
        case 7:
            viewAnimation.alpha = 0.0
            SOAnimation.sharedInstance.simpleAnimationFadeOut(viewAnimation)
        case 8:
            SOAnimation.sharedInstance.bounceEffectTo(viewAnimation)
            break
        case 9:
            SOAnimation.sharedInstance.animate(viewAnimation)
        case 10:
            SOAnimation.sharedInstance.shakeView(viewAnimation)
            break
        default:
            break
        }
    }
    
    @IBAction func actionBack(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
