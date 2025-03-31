class Floresta1{
    static let CASE_FLORESTA1 : String = "floresta1"
    static let CASE_PROLOGO: String = "1"
    
    // Cena Prólogo
    static func comecarPrologo()->String{
        printMatriz(matrizPrologo)
        opc = opcao()
        return CASE_FLORESTA1
    }
    
    //Cena Floresta
    static func entrarFloresta1()->String{
        printMatriz(matrizEntradaFloresta)
        opc = opcao()
        if(opc == "1"){
            return "floresta2"
        }
        else{
            return CASE_FLORESTA1
        }

    }
    
}

