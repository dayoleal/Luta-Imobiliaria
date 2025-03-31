class Final{
    static let CASE_VITORIA : String = "vitoria"
    static let CASE_DERROTA: String = "derrota"
    //Caso o Jogador vença
    static func vitoria()->String{
        printMatriz(matrizVitoria1)
        opc = opcao()
        printMatriz(matrizVitoria2)
        opc = opcao()
        return "0"
    }
    //Caso o Jogador perca
    static func derrota()->String{
        printMatriz(matrizDerrota)
        opc = opcao()
        return "0"
    }
}
