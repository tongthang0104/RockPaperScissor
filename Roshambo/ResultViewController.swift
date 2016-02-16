//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Thang H Tong on 2/14/16.
//  Copyright © 2016 Thang. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - Properties
    
    var userPlay: Play!
    @IBOutlet weak var resulImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var userPlayLabel: UILabel!
    @IBOutlet weak var computerPlayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        matchResult(userPlay)
    }
    
    //MARK: - All Functions
    
    func matchResult(image: UIImage, text: String, randomPlay: Int) {
        userPlayLabel.text = userPlay.description
        let computerPlay = Play(rawValue: randomPlay)
        computerPlayLabel.text = computerPlay?.description
        resulImage.image = image
        resultLabel.text = text
    }
    
    func matchResult(userPlay: Play) {
        
        self.userPlay = userPlay
        let randomPlay = Int(arc4random_uniform(3))
        
        switch (userPlay, randomPlay) {
        case (userPlay, randomPlay) where userPlay.rawValue == randomPlay:
            matchResult(UIImage(named: "itsATie")!, text: "Tie!", randomPlay: randomPlay)
        case (Play.Rock, 2) :
            matchResult(UIImage(named: "RockCrushesScissors")!, text: "Rock break scissors! You win!", randomPlay: randomPlay)
        case(Play.Rock, 1):
            matchResult(UIImage(named: "PaperCoversRock")!, text: "Paper cover rock! You lost!", randomPlay: randomPlay)
        case (Play.Paper, 0):
            matchResult(UIImage(named: "PaperCoversRock")!, text: "Paper cover rock! You win!", randomPlay: randomPlay)
        case (Play.Paper, 2):
            matchResult(UIImage(named: "ScissorsCutPaper")!, text: "Scissor cut paper! You lost", randomPlay: randomPlay)
        case (Play.Scissor, 1):
            matchResult(UIImage(named: "ScissorsCutPaper")!, text: "Scissor cut paper!You win!", randomPlay: randomPlay)
        case (Play.Scissor, 0):
            matchResult(UIImage(named: "RockCrushesScissors")!, text: "Rock break scissors! You lost", randomPlay: randomPlay)
        default:
            print("no result")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Action
    
    @IBAction func retryButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
