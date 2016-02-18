//
//  GameViewController.swift
//  Roshambo
//
//  Created by Thang H Tong on 2/14/16.
//  Copyright © 2016 Thang. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK : Properties
    
    var play: Play?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Action
    
    @IBAction func rockButtonTapped(sender: UIButton) {
        var resultController: ResultViewController
        resultController = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        userPlay(sender)
        resultController.userPlay = self.play
        self.presentViewController(resultController, animated: true, completion: nil)
    }
    
    @IBAction func cuttingHandShape(sender: UIButton) {
        sender.tag = 2
        userPlay(sender)
    }

    @IBAction func papersButtonTapped(sender: UIButton) {
        sender.tag = 1
        userPlay(sender)
        performSegueWithIdentifier("fromPaper", sender: sender)
    }
    
    // userPlay function
    func userPlay(sender: AnyObject) {
        let play = Play(rawValue: sender.tag)
        self.play = play
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultController = segue.destinationViewController as! ResultViewController
        resultController.userPlay = self.play
    }
}
