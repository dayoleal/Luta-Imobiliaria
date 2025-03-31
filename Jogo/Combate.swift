class Combate{
    static let CASE_LUTA_INIMIGO : String = "lutaInimigo"
    var defesaPlayer: Bool = false
    var defesaEnemy: Bool = false

    //as possíveis ações do jogador
    func acaoCombatePlayer(_ acao: String) -> Double{
        var dano: Double = 0
        switch acao{
        //Caso a escolha do jogador for Ataque o poder dele vai ser definido aleatoriamente.
        case "ataquePlayer1":
            let random = Int.random(in: 1..<11)
            if(random >= 5){
                dano = player1.atk
            }
            else if(random < 5 && random >= 3 ){
                dano = player1.atk*1.15
            }
            else{
                dano = player1.atk*0.85
            }
            return dano
        //Caso a escolha do jogador for Defender.
        case "defesaPlayer1":
            defesaPlayer = true
            return 0
        //Caso a escolha do jogador for uma Ultimate.
        case "ultPlayer1":
            dano = player1.atk * 2
            return dano
            
        default:
            break
        }
        return 0
    }
    
    //ataques aleatórios do inimigo
    func acaoCombateEnemy(enemy: Enemy, turno: Int) -> Double{
        var dano: Double = 0
        let acao = randEnemy(turno: turno)
        switch acao{
        //Caso a escolha do aleatória for Ataque o poder dele vai ser definido aleatoriamente.
        case 1:
            let random = Int.random(in: 1..<11)
            if(random >= 5){
                dano = enemy.atk
            }
            else if(random < 5 && random >= 3 ){
                dano = enemy.atk*1.15
            }
            else{
                dano = enemy.atk*0.85
            }
            return dano
        
        //Caso a escolha aleatória for Defesa.
        case 2:
            defesaEnemy = true
            return 0
        
        //Caso a escolha aleatória for Ultimate.
        case 3:
            dano = enemy.atk * 2
            return dano
            
        default:
            break
        }
        return 0
    }
     
    //escolha aleatória das ações do Inimigo.
    func randEnemy(turno: Int)->Int{
        let random = Int.random(in: 1..<4)
        if random == 3 && turno >= 3{
            return random
        }
        else if random == 1 || random == 2{
            return random
        }
        else{
            return 1
        }
    }
    
    //função principal de combate com chamada das funções do player e inimigo
    func combate(enemy: Enemy, final: String, menu: [[String]], atkPlayer: [[String]], defPlayer: [[String]], ultPlayer: [[String]], ultPlayerFail: [[String]], atkPlayerFail: [[String]], atkEnemy: [[String]], defEnemy: [[String]])->String{
        var dano: Double = 0
        var turnoPlayer: Int = 0
        var turnoEnemy: Int = 0
        //O combate dura enquanto o inimigo tiver vivo
        while enemy.hp > 0{
            //Turno Inimigo
            dano = acaoCombateEnemy(enemy: enemy, turno: turnoEnemy)
            //Se o jogador não estiver defendendo
            if defesaPlayer == false{
                player1.hp -= dano
                //Imagem se o inimigo for atacar
                if defesaEnemy == false{
                    printMatrizCombate(atkEnemy, enemy)
                    opc = opcao()
                    //Verifica se o jogador esta vivo
                    if player1.hp < 1{
                        return Final.CASE_DERROTA
                    }
                }
                //Imagem se o inimigo for defender
                else{
                    printMatrizCombate(defEnemy, enemy)
                    opc = opcao()
                }
            }
            //Se o Jogador estiver defendendo
            else{
                player1.hp -= (dano*0.15)
                //verifica se o jogador ainda esta vivo
                if player1.hp < 1{
                    return Final.CASE_DERROTA
                }
                printMatrizCombate(atkEnemy, enemy)
                defesaPlayer = false
                opc = opcao()
            }
            
            //Turno Player
            printMatrizCombate(menu, enemy)
            opc = opcao()
            //Se o jogador escolher Atacar
            if opc == "1"{
                dano = acaoCombatePlayer("ataquePlayer1")
                //Caso o Inimigo esteja defendendo
                if defesaEnemy == false{
                    enemy.hp -= dano
                    //Verifica se o inimigo esta vivo
                    if enemy.hp <= 0{
                        return final
                    }
                    printMatrizCombate(atkPlayer, enemy)
                    opc = opcao()
                }
                //Caso o inimigo esteja defendendo
                else{
                    enemy.hp -= (dano*0.15)
                    //verifica se o inimigo esta vivo
                    if enemy.hp <= 0{
                        return final
                    }
                    defesaEnemy = false
                    printMatrizCombate(atkPlayer, enemy)
                    opc = opcao()
                }
            }
            //Caso o jogador escolha defender
            else if (opc == "2"){
                dano = acaoCombatePlayer("defesaPlayer1")
                printMatrizCombate(defPlayer, enemy)
                defesaEnemy = false
                opc = opcao()
            }
            //Caso o jogador escolha usar a Ult
            else if(opc == "3"){
                //Caso o contador do jogador for >=3 ele pode usar a ult
                if turnoPlayer >= 3{
                    dano = acaoCombatePlayer("ultPlayer1")
                    //caso o inimigo não estiver defendendo
                    if defesaEnemy == false{
                        enemy.hp -= dano
                        //Verifica se o inimigo esta vivo
                        if enemy.hp <= 0{
                            return final
                        }
                        printMatrizCombate(ultPlayer, enemy)
                        opc = opcao()
                    }
                    //Caso o inimigo estiver defendendo
                    else{
                        enemy.hp -= (dano*0.15)
                        if enemy.hp <= 0{
                            return final
                        }
                        defesaEnemy = false
                        printMatrizCombate(ultPlayer, enemy)
                        opc = opcao()

                    }
                    turnoPlayer = 0
                }
                // Caso o contador do usuario for < 3 ele erra a ult
                else{
                    printMatrizCombate(ultPlayerFail, enemy)
                    opc = opcao()
                }
            }
            // Caso o jogador coloque um input invalido
            else{
                printMatrizCombate(atkPlayerFail, enemy)
                defesaEnemy = false
                opc = opcao()
            }
            
            turnoPlayer += 1
            turnoEnemy += 1
            
        }
        return final
    }
}

let luta = Combate()
