//
//  ViewController.swift
//  SOEasyAnimation
//
//  Created by Hitesh on 9/2/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tblTypeAnimation : UITableView!
    
    var arrAnimations = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        arrAnimations = ["ViewScaleEffect","ViewAnimationFromTop","viewAnimationFromBottom","viewBounceFromLeft","viewBounceFromRight", "viewAnimationByFrame", "viewAnimationFadeIN", "viewAnimationFadeOUT", "viewAnimationBounce", "viewAnimatePopup", "viewShake"]
        

    }
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let objAnimationVC = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewControllerID") as! SecondViewController
        objAnimationVC.iRow = indexPath.row
        self.navigationController?.pushViewController(objAnimationVC, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAnimations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
        cell.textLabel?.text = arrAnimations[forRowAtIndexPath.row] as? String
        
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

