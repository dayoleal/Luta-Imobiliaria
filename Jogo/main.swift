// Tela Inicial
printMatriz(matrizMenuPrincipal)
var opc = opcao()
if opc == "1"{
    opc = Floresta1.CASE_PROLOGO
}
else if opc == "2"{
    opc = Menu.CASE_AJUDA
}
else if opc == "3"{
    opc = "3"
}
else{
    opc = Menu.CASE_MENU
}
// Valores Booleanos
var repeticao: Bool = true
var hp = player1.hp

// While para Logica de cenas
while (repeticao == true){
    switch (opc){
    // Menu Principal
    case Menu.CASE_MENU:
        reset()
        opc = Menu.comecarMenu()
        break
    // Menu Help
    case Menu.CASE_AJUDA:
        opc = Menu.interagirAjuda()
        break
        
    //Prologo
    case Floresta1.CASE_PROLOGO:
        opc = Floresta1.comecarPrologo()
        break
        
    //Entrada Floresta
    case Floresta1.CASE_FLORESTA1:
        opc = Floresta1.entrarFloresta1()
        break
        
    //Floresta
    case Floresta2.CASE_FLORESTA2:
        opc = Floresta2.entrarFloresta2()
        break
        
    //Sapo
    case Floresta2.CASE_SAPO:
        opc = Floresta2.interagirSapo()
        break
        
    //Mago
    case Floresta2.CASE_MAGO:
        opc = Floresta2.interagirMago()
        break
    
    //Floresta 3
    case Floresta3.CASE_FLORESTA3:
        opc = Floresta3.entrarFloresta3()
        break
        
    //Arbusto
    case Floresta3.CASE_ARBUSTO:
        opc = Floresta3.interagirArbusto()
        break
        
    //Espada
    case Floresta3.CASE_ESPADA:
        opc = Floresta3.interagirEspada()
        break
        
    //Frente Casa
    case FrenteCasa.CASE_FRENTE_CASA:
        opc = FrenteCasa.entrarFrenteCasa()
        break
        
    //Porta
    case FrenteCasa.CASE_PORTA:
        opc = FrenteCasa.interagirPorta()
        break
        
    //Placa
    case FrenteCasa.CASE_PLACA:
        opc = FrenteCasa.interagirPlaca()
        break
        
    //Janela
    case FrenteCasa.CASE_JANELA:
        opc = FrenteCasa.interagirJanela()
        break
        
    //Dentro da casa
    case Casa.CASE_CASA:
        opc = Casa.entrarCasa()
        break
          
    //Interagir com quadro
    case Casa.CASE_QUADRO:
        opc = Casa.interagirQuadro()
        break
        
    //Interagir com estante
    case Casa.CASE_ESTANTE:
        opc = Casa.interagirEstante()
        break
        
    //senha
    case Casa.CASE_SENHA:
        opc = Casa.interagirSenha()
        break
        
    //Interagir com Tapete
    case Casa.CASE_TAPETE:
        opc = Casa.interagirTapete()
        break
        
    //Interagir com alcapao
    case Casa.CASE_ALCAPAO:
        opc = Casa.interagirAlcapao()
        break
    
    //Interagir com o diálogo inicial do inimigo
    case Casa.CASE_DIALOGO_INIMIGO:
        opc = Casa.interagirDialogoInimigo()
        break
    
    //Derrota
    case Final.CASE_DERROTA:
        opc = Final.derrota()
        break
        
    //Vitória
    case Final.CASE_VITORIA:
        opc = Final.vitoria()
        break
        
    default:
            repeticao = false
            break
    }
     
}











