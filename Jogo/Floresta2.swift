class Floresta2{
    static let CASE_SAPO : String = "sapo"
    static let CASE_FLORESTA2: String = "floresta2"
    static let CASE_MAGO: String = "mago"
    static var vida: Bool = false
    //Menu floresta2
    static func entrarFloresta2()->String{
        printMatriz(matrizFloresta2)
        opc = opcao()
        if(opc == "1"){
            return CASE_SAPO
        }
        else if(opc == "2"){
            return Floresta3.CASE_FLORESTA3
        }
        else if(opc == "3"){
            return CASE_MAGO
        }
        else if (opc == "4"){
            return Floresta1.CASE_FLORESTA1
        }
        else{
            return CASE_FLORESTA2
        }
    }
    
    //Função para interagir com o sapo
    static func interagirSapo()->String{
        printMatriz(matrizSapo)
        opc = opcao()
        return CASE_FLORESTA2
    }
    
    //Função para interagir com o mago
    static func interagirMago()->String{
        printMatriz(matrizMago1)
        opc = opcao()
        if(opc == "1"){
            printMatriz(matrizMago2)
            opc = opcao()
            
            //verificar se o buff já foi pego
            if(vida == false){
                player1.hp += 20
                vida = true
            }
            return CASE_FLORESTA2
        }
        else if(opc == "2"){
            return CASE_FLORESTA2
        }
        else{
            return CASE_MAGO
        }
    }
}
