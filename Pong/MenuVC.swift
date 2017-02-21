//
//  MenuVC.swift
//  Pong
//
//  Created by Benjamin Macmillan on 2/20/17.
//  Copyright © 2017 Bloop Studios. All rights reserved.
//

import Foundation
import UIKit

enum gameType {
    case easy
    case medium
    case hard
}

class MenuVC : UIViewController {
    
    @IBAction func easyGame(_ sender: Any) {
        moveToGame(game: .easy)
    }
    
    @IBAction func mediumGame(_ sender: Any) {
        moveToGame(game: .medium)
    }
    
    @IBAction func hardGame(_ sender: Any) {
        moveToGame(game: .hard)
    }
    
    func moveToGame(game : gameType) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        currentGameType = game
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
}









