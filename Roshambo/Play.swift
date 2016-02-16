//
//  Play.swift
//  Roshambo
//
//  Created by Thang H Tong on 2/14/16.
//  Copyright © 2016 Thang. All rights reserved.
//

import Foundation

enum Play: Int {
    case Rock = 0
    case Paper = 1
    case Scissor = 2
    
    var description: String {
        switch self {
        case .Rock:
            return "Rock"
        case .Paper:
            return "Paper"
        case .Scissor:
            return "Scissor"
            
        }
    }
    
}

