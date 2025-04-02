class FrenteCasa{
    static let CASE_JANELA : String = "janela"
    static let CASE_FRENTE_CASA: String = "frenteCasa"
    static let CASE_PORTA: String = "porta"
    static let CASE_PLACA: String = "placa"
    
    //Menu Frente Casa
    static func entrarFrenteCasa()->String{
        printMatriz(matrizFrenteCasa1)
        opc = opcao()
        if(opc == "1"){
            return CASE_JANELA
        }
        else if(opc == "2"){
            return CASE_PLACA
        }
        else if(opc == "3"){
            return CASE_PORTA
        }
        else if(opc == "4"){
            return Floresta3.CASE_FLORESTA3
        }
        else{
            return CASE_FRENTE_CASA
        }
    }
    
    //Função para interagir com a porta
    static func interagirPorta()->String{
        printMatriz(matrizPorta)
        opc = opcao()
        return CASE_FRENTE_CASA
    }
    
    //Função para interagir com placa
    static func interagirPlaca()->String{
        // Caso o Esqueleto esteja vivo
        if enemyEsqueleto.hp>0{
            printMatriz(matrizPlaca)
            opc = opcao()
            if(opc == "1"){
                hp = player1.hp
                opc = luta.combate(enemy: enemyEsqueleto, final: CASE_FRENTE_CASA, menu: matrizLutaPlacaMenu, atkPlayer: matrizLutaPlacaAtkPlayer, defPlayer: matrizLutaPlacaDefPlayer, ultPlayer: matrizLutaPlacaUltPlayer, ultPlayerFail: matrizLutaPlacaUltFailPlayer, atkPlayerFail: matrizLutaPlacaAtkFail, atkEnemy: matrizLutaPlacaAtkEnemy, defEnemy: matrizLutaPlacaDefEnemy)
                player1.hp = hp
                if opc == Final.CASE_DERROTA{
                    return Final.CASE_DERROTA
                }
                printMatriz(matrizFrenteCasa2)
                opc = opcao()
                return CASE_FRENTE_CASA
                
            }
            else if(opc == "2"){
                return CASE_FRENTE_CASA
            
            }
            else{
                return CASE_PLACA
            }
        }
        // Caso o Esqueleto esteja morto
        else{
            printMatriz(matrizFrenteCasa2)
            opc = opcao()
            return CASE_FRENTE_CASA
        }
    }
    
    //Função para interagir com a janela
    static func interagirJanela()->String{
        printMatriz(matrizJanela1)
        opc = opcao()
        if (opc == "1"){
            //Caso o Jogador já tenha matado o Castor
            if(Floresta3.pedra == true){
                printMatriz(matrizJanela4)
                opc = opcao()
                return Casa.CASE_CASA
            }
            //Caso o Jogador não tenha matado o Castor
            else{
                printMatriz(matrizJanela2)
                opc = opcao()
        
                if(opc == "1"){
                    player1.hp -= 10
                    printMatrizJanela(matrizJanela3)
                    opc = opcao()
                    if(player1.hp <= 0){
                        return Final.CASE_DERROTA
                    }
                    return CASE_JANELA
                }
                else{
                    return CASE_JANELA
                }
            }
        }
        else if(opc == "2"){
            return CASE_FRENTE_CASA
        }
        else{
            return CASE_JANELA
        }
    }
}
    


