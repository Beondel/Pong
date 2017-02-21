//
//  GameScene.swift
//  Pong
//
//  Created by Benjamin Macmillan on 2/19/17.
//  Copyright © 2017 Bloop Studios. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player = SKSpriteNode()
    var enemy = SKSpriteNode()
    var ball = SKSpriteNode()
    var playerScoreLabel = SKLabelNode()
    var enemyScoreLabel = SKLabelNode()
    var score = [Int]()
    
    override func didMove(to view: SKView) {
        startGame()
        
        playerScoreLabel = self.childNode(withName: "playerScoreLabel") as! SKLabelNode
        enemyScoreLabel = self.childNode(withName: "enemyScoreLabel") as! SKLabelNode
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -30, dy: -30))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
    }
    
    func startGame() {
        score = [0, 0]
        playerScoreLabel.text = "\(score[0])"
        enemyScoreLabel.text = "\(score[1])"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    func addScore() {
        if (ball.position.y >= enemy.position.y + 30) {
            self.score[0] += 1
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ball.physicsBody?.applyImpulse(CGVector(dx: -30, dy: -30))
        } else if (ball.position.y <= player.position.y - 30) {
            self.score[1] += 1
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ball.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 30))
        }
        ball.position = CGPoint(x: 0, y: 0)
        playerScoreLabel.text = "\(score[0])"
        enemyScoreLabel.text = "\(score[1])"
    }
    
    override func update(_ currentTime: TimeInterval) {
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
        
        if (ball.position.y <= player.position.y - 30 || ball.position.y >= enemy.position.y + 30) {
            addScore()
        }
    }
}










