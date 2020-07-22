algoritmo "Jogo Velha"
var
   v: vetor[1..3, 1..3] de caractere
   l, c, cont, po: Inteiro
   simb: Caractere
   R: Logico

Procedimento mostraVelha()
inicio
      Escreval("+---+---+---+")
      Para l <- 1 ate 3 faca
           Para c <- 1 ate 3 faca
           Escreva("|  ", v[l, c]:1)
           FimPara
           Escreva("|")
           Escreval()
           Escreval("+---+---+---+")
      FimPara
FimProcedimento

Procedimento mudaJogador()
inicio
      Se (simb = "X") entao
         simb <- "0"
      Senao
         simb <- "X"
      FimSe
FimProcedimento

Funcao jogar(s: caractere; p: Inteiro): Logico
var mudou: Logico
inicio
      mudou <- falso
      Para l <- 1 ate 3 faca
           Para c <- 1 ate 3 faca
                Se (v[l, c] = numpcarac(p)) entao
                   v[l, c] <- s
                   mudou <- verdadeiro
                FimSe
           FimPara
      FimPara
      Retorne mudou
FimFuncao

Funcao terminouVelha(): Logico
var
   terminou: Logico
   ocorr: Inteiro
inicio
      terminou <- falso
 // Jogos em linha
    Para l <- 1 ate 3 faca
         Se (v[l, 1] = v[l, 2]) e (v[l, 2] = v[l, 3]) entao
            terminou <- verdadeiro
         FimSe
    FimPara
 // Jogos em coluna
    Para c <- 1 ate 3 faca
         Se (v[1, c] = v[2, c]) e (v[2, c] = v[3, c]) entao
            terminou <- verdadeiro
         FimSe
    FimPara
 // Jogos em diagonal
    Se (v[1, 1] = v[2, 2]) e (v[2, 2] = v[3, 3]) entao
       terminou <- verdadeiro
    FimSe
    Se (v[1, 3] = v[2, 2]) e (v[2, 2] = v[3, 1]) entao
       terminou <- verdadeiro
    FimSe
 // Jogos em velha
    ocorr <- 0
    Para l <- 1 ate 3 faca
         Para c <- 1 ate 3 faca
              Se (v[l, c] <> "X") e (v[l, c] <> "0") entao
                 ocorr <- ocorr + 1
              FimSe
         FimPara
    FimPara
    Se (ocorr = 0) entao
       terminou <- verdadeiro
    FimSe
 // Retorna se o jogo acabou ou nao
    Retorne terminou
FimFuncao

inicio
      cont <- 1
      simb <- "X"
      Para l <- 1 ate 3 faca
           Para c <- 1 ate 3 faca
                v[l, c] <- numpcarac(cont)
                cont <- cont + 1
           FimPara
      FimPara
      mostraVelha()
      Repita
      Repita
      Escreval("Vai jogar [ ", simb:1, " ] em qual posição ?")
      Leia(po)
      R <- jogar(simb, po)
      Se (R = falso) entao
         Escreval("Jogada Invalida ! ")
      FimSe
      Ate (R = verdadeiro)
          mudaJogador()
          LimpaTela
          mostraVelha()
      Ate (terminouVelha() = verdadeiro)
      Escreval(" Jogo Finalizado !!! ")
fimalgoritmo