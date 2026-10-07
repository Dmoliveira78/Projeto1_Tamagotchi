programa{
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	
	funcao inicio(){
		inteiro menu // menu principal
		inteiro confirmarNome = 0 //confirmação do nome do pet
		inteiro felicidade = 5// Comer, brincar e dormir aumenta, maximo 10 se chegar a 0 morre, Pet vencer aumenta em 5 e caso perder aumenta em 3
		inteiro limpezaPet = 10// Ao passar o tempo diminui, chegar em 0 morre
		inteiro fomePet = 0 //Passar tempo a fome aumenta, alimentar diminui 4 pontos de fome, se tiver em 0 a fome e alimentar a felicidade diminui em 2
		inteiro horasDoDia = 0   // total de horas passadas
		inteiro diasVivo = 0 //Maximo 7 dias de vida, a cada 24hrs envelhece 1 dia
		inteiro horasDoente = 0 // horas desde que a doença começou
		inteiro sorteio = 0
		inteiro jogadaJogador = 0
		inteiro pet = 0
		logico doente = falso //Pet incia saudavel
		logico vivo = verdadeiro //Pet inicia vivo
		logico empate = verdadeiro
		cadeia nomePet = ""	//nome do pet
		cadeia nomePetCAlta = "" //transoforma o nome do pet em caixa alta
			
			escreva("BEM-VINDO AO SEU PET VIRTUAL\n")

			// Recebe o nome e confirma o nome digitado ::::
			enquanto(confirmarNome !=1){	
				
				escreva("DIGITE O NOME DO SEU PET: ")
				leia(nomePet)
				nomePetCAlta = t.caixa_alta(nomePet)
				limpa() //Faz Uma Limpeza na tela
				confirmarNome = 0
				
				//Verifica se a opcao digitada e diferente de 1 e 2, e se for diferente vai continuar repetindo
				enquanto(confirmarNome != 1 e confirmarNome != 2){
					escreva("O NOME DO SEU PET SERÁ: ", nomePetCAlta, "\n",
					   "CONFIRME O NOME DIGITANDO 1.\n",
					   "PARA ALTERAR DIGITE 2.\n")
					leia(confirmarNome)
					limpa()
					se(confirmarNome != 1 e confirmarNome != 2){
           				 escreva("OPCAO INVALIDA! DIGITE 1-CONFIRMAR OU 2-ALTERAR NOME.\n\n")          			           	 			
        				}
				}													
			}
			
			// inicio do loop do pet ::::
			faca{					
				escreva("--MENU--\n",
					   "1-AVANCAR NO TEMPO\n",
					   "2-ALIMENTAR\n",
					   "3-JOGAR\n",
					   "4-DAR BANHO\n",
					   "5-VER STATUS\n",
					   "6-DESLIGAR")
					   
				escreva("\nESCOLHA UMA OPCAO DO MENU: ")
				leia(menu)
				limpa() //Faz Uma Limpeza na tela
				
				escolha(menu){
					caso 1:
						// 1) passa 8 horas e aumenta a idade
						horasDoDia = horasDoDia + 8  
						se(horasDoDia == 24){
							diasVivo = diasVivo + 1
							horasDoDia = 0
							}
						//						
						limpezaPet = limpezaPet - 2 // 2 Escolhido por mim pois na ta especifico no projeto, colocar condicao ao tomar banho
						fomePet = fomePet + 2	//Colocar condicao ao alimentar    
					
						// felicidade cai se estiver muito sujo, nao esta definido quanto perde e apartir de qual valor fica muito sujo
						se(limpezaPet <= 4){
							felicidade = felicidade - 1
						}
					
						// para curar o pet
						se(doente){
							horasDoente = horasDoente + 8
							sorteio = u.sorteia(1, 3)
							se(horasDoente == 8 e sorteio == 1){        // 33,3% de curar
								doente = falso
							}senao se(horasDoente == 16 e sorteio <= 2){ // 66,6% de curar
								doente = falso
							}senao se(horasDoente >= 24){                // 100% de curar
								doente = falso
							}
							se(doente == falso){					
								horasDoente = 0
								escreva(nomePetCAlta, " PET SE CUROU!\n")
							}
						}senao{
							sorteio = u.sorteia(1, 100) //Aqui e a chance do pet ficar doente de forma aleatoria, podemos fazer de outra forma
							se(sorteio <= 15){                           
								doente = verdadeiro
								horasDoente = 0
								escreva(nomePetCAlta, " FICOU DOENTE!\n")
							}
						}
					
						// pra nao passar do limite de felicidade e limpeza
						se(felicidade > 10){
							felicidade = 10
						}
						se(felicidade < 0){
							felicidade = 0
							}
						se(limpezaPet < 0){
							limpezaPet = 0
						}
					
						//verifica a morte do pet
						se(felicidade <= 0){
							vivo = falso
							escreva("PET MORREU DE TRISTEZA")
						}senao se(limpezaPet <= 0){
							vivo = falso
							escreva("PET MORREU DE SUJEIRA")
						}senao se(fomePet >= 10){
							vivo = falso
							escreva("PET MORREU DE FOME")
						}senao se(diasVivo >= 7){
							vivo = falso
							escreva("VOCE GANHOU!! O PET MORREU DE VELHICE")
						}
					pare
					
					caso 2:
					pare
					
					caso 3:
						escreva("\nVAMOS JOGAR JOKENPO COM ", nomePetCAlta, "!\n")
						empate = verdadeiro

						//Vai repetir enquando der empate				
						enquanto(empate){
							escreva("1-PEDRA | 2-PAPEL | 3-TESOURA\n")
							escreva("QUAL SERA SUA JOGADA? ")
							leia(jogadaJogador)
					
							se(jogadaJogador < 1 ou jogadaJogador > 3){
								escreva("JOGADA INVALIDA! ESCOLHA 1, 2 OU 3.\n")
							}senao{
								pet = u.sorteia(1, 3)
								escreva("VOCE: ", jogadaJogador, " | ", nomePetCAlta, ": ", pet, "\n")
					
								se(jogadaJogador == pet){
									escreva("EMPATE! JOGUE NOVAMENTE...\n\n")
								}senao{
									empate = falso
									// pet ganha quando
									se((pet == 1 e jogadaJogador == 3) ou (pet == 2 e jogadaJogador == 1) ou (pet == 3 e jogadaJogador == 2)){
										felicidade = felicidade + 5
										escreva(nomePetCAlta, " VOCE VENCEU! (+5 DE FELICIDADE).\n")
									}senao{
										felicidade = felicidade + 3
										escreva(nomePetCAlta, " PERDEU, MAS SE DIVERTIU! (+3 DE FELICIDADE).\n")
									}
								}
							}
						}
						//aqui caso a felicidade seja maior que 10 a felicidade recebe 10 para nao passar do limite
						se(felicidade > 10){
							felicidade = 10
						}
					pare
					caso 4:
					pare
					caso 5:
					pare
					caso 6:
						escreva("PROGRAMA DESLIGADO")
					pare
					caso contrario:
						escreva("OPCAO INVALIDA!! DIGITE UMA OPCAO DE 1 A 6") 
					}						
			}enquanto((menu != 6 ) e vivo)
							
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4341; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */