//
//  SOAnimation.swift
//  SOAnimation
//
//  Created by Hitesh on 5/26/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

let kTransitionDuration = 0.3;

class SOAnimation: NSObject {
    
    class var sharedInstance: SOAnimation {
        struct Static {
            static let instance : SOAnimation = SOAnimation()
        }
        return Static.instance
    }
    
    func animationScaleEffects(view:UIView!, aniTime:Float!){
        UIView.animateWithDuration(NSTimeInterval(aniTime), animations: {
            view.transform = CGAffineTransformMakeScale(0.001,0.001)
            let animation:CABasicAnimation = CABasicAnimation(keyPath: "transform")
            
            animation.toValue = NSValue(CATransform3D: CATransform3DMakeRotation(CGFloat(M_PI), 1,0,0))
            animation.duration = CFTimeInterval(aniTime)
            }, completion: {completion in
                UIView.animateWithDuration(NSTimeInterval(aniTime), animations: {
                    view.transform = CGAffineTransformMakeScale(1,1)
                })
        })
    }
    
    func performTranslationAnimationInViewFromBottom(viewToTranslate: UIView) {
        viewToTranslate.transform = CGAffineTransformMakeTranslation(0, 300)
        UIView.animateWithDuration(0.5, animations: {() -> Void in
            viewToTranslate.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: { _ in })
    }
    
    
    func performTranslationAnimationInViewFromTop(viewToTranslate: UIView) {
        viewToTranslate.transform = CGAffineTransformMakeTranslation(0, -400)
        UIView.animateWithDuration(0.5, animations: {() -> Void in
            viewToTranslate.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: { _ in })
    }
    
    func performBounceLeftAnimationOnView(view: UIView, duration: NSTimeInterval, delay: NSTimeInterval, completion: () -> Void) {
        // Start
        view.transform = CGAffineTransformMakeTranslation(300, 0)
        // Start
        UIView.animateWithDuration(duration / 4, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {() -> Void in
            view.transform = CGAffineTransformMakeTranslation(-10, 0)
            }, completion: {(finished: Bool) -> Void in
                UIView.animateWithDuration(duration / 4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {() -> Void in
                    // End
                    view.transform = CGAffineTransformMakeTranslation(5, 0)
                    }, completion: {(finished: Bool) -> Void in
                        UIView.animateWithDuration(duration / 4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {() -> Void in
                            // End
                            view.transform = CGAffineTransformMakeTranslation(-2, 0)
                            }, completion: {(finished: Bool) -> Void in
                                UIView.animateWithDuration(duration / 4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {() -> Void in
                                    // End
                                    view.transform = CGAffineTransformMakeTranslation(0, 0)
                                    }, completion: {(finished: Bool) -> Void in
                                })
                        })
                })
        })
        
    }
    
    
    func performBounceRightAnimationOnView(view: UIView, duration: NSTimeInterval, delay: NSTimeInterval) {
        // Start
        view.transform = CGAffineTransformMakeTranslation(-300, 0)
        UIView.animateWithDuration(duration / 4, delay: delay, options: .CurveEaseIn, animations: {() -> Void in
            // End
            view.transform = CGAffineTransformMakeTranslation(10, 0)
            }, completion: {(finished: Bool) -> Void in
                UIView.animateWithDuration(duration / 4, delay: 0, options: .CurveEaseIn, animations: {() -> Void in
                    // End
                    view.transform = CGAffineTransformMakeTranslation(-5, 0)
                    }, completion: {(finished: Bool) -> Void in
                        UIView.animateWithDuration(duration / 4, delay: 0, options: .CurveEaseIn, animations: {() -> Void in
                            // End
                            view.transform = CGAffineTransformMakeTranslation(2, 0)
                            }, completion: {(finished: Bool) -> Void in
                                UIView.animateWithDuration(duration / 4, delay: 0, options: .CurveEaseIn, animations: {() -> Void in
                                    // End
                                    view.transform = CGAffineTransformMakeTranslation(0, 0)
                                    }, completion: {(finished: Bool) -> Void in
                                })
                        })
                })
        })
        
    }
    
    // MARK:
    func simpleAnimationFrame(vwTemp : UIView)
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        vwTemp.frame = CGRectMake(vwTemp.frame.origin.x , vwTemp.frame.origin.y-100, vwTemp.frame.size.width, vwTemp.frame.size.height)
        UIView.commitAnimations()
    }
    
    // MARK: -
    func simpleAnimationFadeIn(vwTemp : UIView)
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        vwTemp.alpha = 0.0
        UIView.commitAnimations()
    }
    
    // MARK:
    func simpleAnimationFadeOut(vwTemp : UIView)
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        vwTemp.alpha = 1.0
        UIView.commitAnimations()
    }
    
    func bounceEffectTo(objButton: UIView) {
        objButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1)
        UIView.animateWithDuration(0.3, animations: {() -> Void in
            objButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2)
            }, completion: {(finished: Bool) -> Void in
                UIView.animateWithDuration(0.1, animations: {() -> Void in
                    objButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9)
                    }, completion: {(finished: Bool) -> Void in
                        UIView.animateWithDuration(0.1, animations: {() -> Void in
                            objButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
                            }, completion: {(finished: Bool) -> Void in
                        })
                })
        })
    }
    
    
    func animate(popupview : UIView) {
        popupview.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001)
        popupview.hidden = false
        
        UIView.animateWithDuration(0.3 / 1, delay: 0.0, options: .CurveEaseIn, animations: {() -> Void in
            var frame: CGRect = popupview.frame
            frame.origin.y = frame.origin.y-50
            //frame.origin.x = 0
            popupview.frame = frame
            }, completion: {(finished: Bool) -> Void in
                NSLog("Completed")
        })
        
        UIView.animateWithDuration(0.3 / 1.5, animations: {() -> Void in
            popupview.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1)
            }, completion: {(finished: Bool) -> Void in
                UIView.animateWithDuration(0.3 / 2, animations: {() -> Void in
                    popupview.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9)
                    }, completion: {(finished: Bool) -> Void in
                        UIView.animateWithDuration(0.3 / 2, animations: {() -> Void in
                            popupview.transform = CGAffineTransformIdentity
                        })
                })
        })
        
    }
    
    
    
    func shakeView(shakeView:UIView) {
        let transformation: CGFloat = 2.0
        let leftShake = CGAffineTransformTranslate(CGAffineTransformIdentity, transformation, -transformation)
        let rigthShake = CGAffineTransformTranslate(CGAffineTransformIdentity, -transformation, transformation)
        
        shakeView.transform = leftShake
        
        UIView.beginAnimations("shake", context:nil)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(6)
        UIView.setAnimationDuration(0.07)
        UIView.setAnimationDelegate(self)
        
        shakeView.transform = rigthShake
        
        UIView.commitAnimations()
    }
}
