import Foundation

class Player{
    var hp: Double = 50
    var atk: Double = 10
}

class Enemy{
    var hp: Double
    var atk: Double
    
    init(hp: Double, atk: Double ){
        self.hp = hp
        self.atk = atk
        
    }
}

let player1 = Player()
var enemyBoss = Enemy(hp: 75, atk: 12)
var enemyCastor = Enemy(hp: 45, atk: 8)
var enemyEsqueleto = Enemy(hp: 55, atk: 10)




