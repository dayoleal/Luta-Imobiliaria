class Menu{
    static let CASE_MENU : String = "0"
    static let CASE_JOGAR: String = "play"
    static let CASE_AJUDA: String = "help"
    static let CASE_SAIR: String = "3"
    
    //Cena Menu
    static func comecarMenu()->String{
        printMatriz(matrizMenuPrincipal)
        opc = opcao()
        if opc == "1"{
            return Floresta1.CASE_PROLOGO
        }
        else if opc == "2"{
            return CASE_AJUDA
        }
        else if opc == "3"{
            return "3"
        }
        else{
            return CASE_MENU
        }
    }

    //Função para interagir com a Ajuda
    static func interagirAjuda()->String{
        printMatriz(matrizAjuda)
        opc = opcao()
        return CASE_MENU
    }
}

