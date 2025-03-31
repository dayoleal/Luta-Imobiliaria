class Casa{
    static let CASE_QUADRO : String = "quadro"
    static let CASE_ESTANTE: String = "estante"
    static let CASE_TAPETE: String = "tapete"
    static let CASE_CASA: String = "casa"
    static let CASE_ALCAPAO: String = "alcapao"
    static let CASE_DIALOGO_INIMIGO: String = "dialogoInimigo"
    static let CASE_SENHA: String = "senha"
    
    //Menu casa
    static func entrarCasa()->String{
        printMatriz(matrizCasa)
        opc = opcao()
        if(opc == "1"){
            return CASE_QUADRO
        }
        else if(opc == "2"){
            return CASE_ESTANTE
        }
        else if(opc == "3"){
            return CASE_TAPETE
        }
        else if(opc == "4"){
            return CASE_SENHA
        }
        else{
            return CASE_CASA
        }
    }
    
    //Interagir com o quadro
    static func interagirQuadro()->String{
        if livro == false{
            printMatriz(matrizQuadro1)
            opc = opcao()
            if(opc == "1"){
                livro = true
                printMatriz(matrizQuadro2)
                opc = opcao()
                return CASE_CASA
            }
            else{
                return CASE_QUADRO
            }
        }
        else{
            printMatriz(matrizQuadro3)
            opc = opcao()
            return CASE_CASA
        }
    }
    
    //Interagir com a estante
    static func interagirEstante()->String{
        // Se não tiver pego o Livro
        if(livro == false){
            printMatriz(matrizEstanteVazia1)
            opc = opcao()
            return CASE_CASA
        }
        // Se tiver pego o Livro
        else{
            //para printar a estante com o Livro
            if estante == true{
                printMatriz(matrizEstanteCheia)
                opc = opcao()
                if opc != "1"{
                    return CASE_ESTANTE
                }
                else{
                    return CASE_CASA
                }
            }
            //Para colocar o Livro na Estante
            else{
                printMatriz(matrizEstanteVazia2)
                opc = opcao()
                printMatriz(matrizEstanteCheia)
                estante = true
                opc = opcao()
                if opc != "1"{
                    return CASE_ESTANTE
                }
                else{
                    return CASE_CASA
                }
            }
        }
    }
    
    //Interagir com o tapete
    static func interagirTapete()->String{
        if (destrancado == true){
            printMatriz(matrizTapete2)
            opc = opcao()
            return CASE_ALCAPAO
        }
        else{
            printMatriz(matrizTapete1)
            opc = opcao()
            return CASE_CASA
        }
    }
    
    //Interagir com a Senha
    static func interagirSenha()->String{
        printMatriz(matrizSenha1)
        opc = opcao()
        if(opc == "1"){
            printMatriz(matrizSenha2)
            senha()
            //Caso a senha digitada for correta
            if destrancado == true{
                printMatriz(matrizSenhaCorreta)
                opc = opcao()
                return CASE_CASA
            }
            //Caso a senha digitada for incorreta
            else{
                printMatriz(matrizSenhaIncorreta)
                opc = opcao()
                return CASE_SENHA
            }
        }
        else if(opc == "2"){
            return CASE_CASA
        }
        else{
            return CASE_SENHA
        }
    }
    
    //Interagir com o alçapão
    static func interagirAlcapao()->String{
        printMatriz(matrizAlcapao)
        opc = opcao()
        printMatriz(matrizPortal)
        opc = opcao()
        return CASE_DIALOGO_INIMIGO
        
    }
    
    //Começo do monólogo do inimigo
    static func interagirDialogoInimigo()->String{
        printMatriz(matrizMonologo1)
        opc = opcao()
        printMatriz(matrizMonologo2)
        opc = opcao()
        opc = luta.combate(enemy: enemyBoss, final: Final.CASE_VITORIA, menu: matrizLutaBossMenu, atkPlayer: matrizLutaBossAtkPlayer, defPlayer: matrizLutaBossDefPlayer, ultPlayer: matrizLutaBossUltPlayer, ultPlayerFail: matrizLutaBossUltFailPlayer, atkPlayerFail: matrizLutaBossAtkFail, atkEnemy: matrizLutaBossAtkEnemy, defEnemy: matrizLutaBossDefEnemy)
        if opc == Final.CASE_VITORIA{
            return Final.CASE_VITORIA
        }
        else{
            return Final.CASE_DERROTA
        }
    }
    
}
    



