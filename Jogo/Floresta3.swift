class Floresta3{
    static let CASE_ARBUSTO : String = "arbusto"
    static let CASE_FLORESTA3: String = "floresta3"
    static let CASE_ESPADA: String = "espada"
    
    //Menu floresta3
    static func entrarFloresta3()->String{
        printMatriz(matrizFloresta3)
        opc = opcao()
        if(opc == "1"){
            return CASE_ARBUSTO
        }
        else if(opc == "2"){
            return FrenteCasa.CASE_FRENTE_CASA
        }
        else if(opc == "3"){
            return CASE_ESPADA
        }
        else if(opc == "4"){
            return Floresta2.CASE_FLORESTA2
        }
        else{
            return CASE_FLORESTA3
        }
    }
    
    //Função para interagir com o arbusto
    static func interagirArbusto()->String{
        // Caso o Castor esteja vivo
        if enemyCastor.hp>0{
            printMatriz(matrizCastor1)
            opc = opcao()
            if(opc == "1"){
                hp = player1.hp
                opc = luta.combate(enemy: enemyCastor, final: CASE_FLORESTA3, menu: matrizLutaCastorMenu, atkPlayer: matrizLutaCastorAtkPlayer, defPlayer: matrizLutaCastorDefPlayer, ultPlayer: matrizLutaCastorUltPlayer, ultPlayerFail: matrizLutaCastorUltFailPlayer, atkPlayerFail: matrizLutaCastorAtkFail, atkEnemy: matrizLutaCastorAtkEnemy, defEnemy: matrizLutaCastorDefEnemy)
                pedra = true
                player1.hp = hp
                // Caso você morra
                if opc == Final.CASE_DERROTA{
                    return Final.CASE_DERROTA
                }
                printMatriz(matrizFloresta4)
                opc = opcao()
                return CASE_FLORESTA3
            }
            else if(opc == "2"){
                return CASE_FLORESTA3
            }
            else{
                return CASE_ARBUSTO
            }
        }
        
        // Caso o Castor esteja morto
        else{
            printMatriz(matrizFloresta4)
            opc = opcao()
            return CASE_FLORESTA3
        }
    }
    
    //Função para interagir com a espada
    static func interagirEspada()->String{
        printMatriz(matrizEspada1)
        opc = opcao()
        if(opc == "1"){
            printMatriz(matrizEspada2)
            //verificar se o buff já foi pego
            if(ataque == false){
                player1.atk += 5
                ataque = true
            }
            opc = opcao()
            return CASE_FLORESTA3
        }
        else if(opc == "2"){
            return CASE_FLORESTA3
        }
        else{
            return CASE_ESPADA
        }
    }
}

