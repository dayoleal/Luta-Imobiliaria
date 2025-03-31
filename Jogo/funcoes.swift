import Darwin
import Foundation
// Input de usuario
func opcao() -> String?{
    // centralização do cursor
    print(" ", terminator: centralizaX())
    while true{
        if let opcao = readLine(){
            if opcao.count>0 || opcao == ""{

                return opcao
            }
        }
    }
}

// Verifica o input da senha1
func senha(){
    opc = opcao()
    if opc == "42739"{
        destrancado = true
    }
}

//Limpa a tela
func clear(){
    let process = Process()
    process.launchPath = "/bin/bash"
    process.arguments = ["-c", "clear"]
    process.launch()
    process.waitUntilExit()
}


// Função para obter o tamanho atual do terminal
func tamanhoTerminal() -> (largura: Int, altura: Int) {
    var tamJanela = winsize()
    let z = ioctl(STDOUT_FILENO, TIOCGWINSZ, &tamJanela)
    if (z == 0){
        print(" ")
    }
    return (Int(tamJanela.ws_col), Int(tamJanela.ws_row))
}


//Funcao para printar a matriz
func printMatriz(_ matriz:[[String]]){
    clear()
    let centralizaMatriz = centraliza(cena: matriz)
    for i in 0..<matriz.count{
        print(" ")
        for j in 0..<1{
            print(centralizaMatriz + matriz[i][j], terminator: "")
        }
    }
    print(" ")

}

// Funcao para printar as matrizes de combate
func printMatrizCombate(_ matriz:[[String]],_ enemy: Enemy){
    clear()
    let centralizaMatriz = centraliza(cena: matriz)
    for i in 0..<matriz.count{
        print(" ")
        for j in 0..<1{
            if i == 2{
                print(centralizaMatriz + "|        HP PERSONAGEM - \(player1.hp < 10 ? "\(player1.hp.rounded()) " : "\(player1.hp.rounded())")                               HP INIMIGO - \(enemy.hp < 10 ? "\(enemy.hp.rounded()) " : "\(enemy.hp.rounded())")       |", terminator: "")
            }
            else{
                print(centralizaMatriz + matriz[i][j], terminator: "")
            }
            
        }
    }
    print(" ")

}

//Funcao para printar a matriz da janela
func printMatrizJanela(_ matriz:[[String]]){
    clear()
    let centralizaMatriz = centraliza(cena: matriz)
    for i in 0..<matriz.count{
        print(" ")
        for j in 0..<1{
            if i == 2{
                print(centralizaMatriz + "|                                HP PERSONAGEM  \(player1.hp < 10 ? "\(player1.hp.rounded()) " : "\(player1.hp.rounded())")                                |", terminator: "")
            }
            else{
                print(centralizaMatriz + matriz[i][j], terminator: "")
            }
            
        }
    }
    print(" ")

}

// Função usada para centralizar cursor
func centralizaX()->String {
    let (larguraTerminal, _) = tamanhoTerminal() //tamanho do terminal
    let larguraCena: Int = 83//tamanho da linha em caracteres
    //calcula deslocamento
    let espacoX = max((larguraTerminal/2) - larguraCena/2, 0)
    // Adiciona espaços à esquerda para centralizar cada linha
    let margemLinha = String(repeating: " ", count: espacoX)
    return margemLinha
}


//Centralizar
func centraliza(cena: [[String]])->String {
    let (larguraTerminal, alturaTerminal) = tamanhoTerminal() //tamanho do terminal
    let alturaCena: Int = cena.count
    let larguraCena: Int = 83//tamanho da linha em caracteres
    //calcula deslocamento
    let espacoX = max((larguraTerminal/2) - larguraCena / 2, 0)
    let espacoY = max(((alturaTerminal/2) - alturaCena/2), 0)
   
    for _ in 0..<espacoY {
        print("\n", terminator: "")
    }
    // Adiciona espaços à esquerda para centralizar cada linha
    let margemLinha = String(repeating: " ", count: espacoX)
    return margemLinha
}

//funcao para resetar os dados
func reset(){
    pedra  = false
    livro  = false
    vida  = false
    ataque  = false
    destrancado  = false
    estante  = false
    player1.hp = 50
    player1.atk = 10
    enemyBoss.hp = 75
    enemyCastor.hp = 45
    enemyEsqueleto.hp = 55
}

