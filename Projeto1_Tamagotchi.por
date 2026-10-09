programa{
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	
	funcao inicio(){
		// ====== MENU ====== //
		inteiro menu 

		// ====== NOME ====== //
		inteiro confirmarNome = 0 //confirmação do nome do pet
		cadeia nomePet = ""	//nome do pet
		cadeia nomePetCAlta = "" //transoforma o nome do pet em caixa alta
		cadeia pausa // pausa antes de continuar para o menu

		// ===== STATUS ===== //
		inteiro felicidadePet = 5// Comer, brincar e dormir aumenta, maximo 10 se chegar a 0 morre, Pet vencer aumenta em 5 e caso perder aumenta em 3
		inteiro limpezaPet = 10// Ao passar o tempo diminui, chegar em 0 morre
		inteiro fomePet = 0 //Passar tempo a fome aumenta, alimentar diminui 4 pontos de fome, se tiver em 0 a fome e alimentar a felicidade diminui em 2
				
		// ==== BRINCAR ==== //
		inteiro sorteio = 0
		inteiro jogadaJogador = 0
		inteiro jogadaPet = 0

		// ==== DIAS VIVO E DOENTE ==== //
		inteiro horasDoDia = 0   // total de horas passadas
		inteiro diasVivo = 0 //Maximo 7 dias de vida, a cada 24hrs envelhece 1 dia
		inteiro horasDoente = 0 // horas desde que a doença começou
		logico doente = falso //Pet incia saudavel
		logico vivo = verdadeiro //Pet inicia vivo
		
			
			escreva("BEM-VINDO AO SEU PET VIRTUAL\n")

			// RECEBER O NOME DO PET //
			enquanto(confirmarNome !=1){	
				
				escreva("DIGITE O NOME DO SEU PET: ")
				leia(nomePet)
				nomePetCAlta = t.caixa_alta(nomePet)
				limpa() //LIMPEZA DE TELA
				confirmarNome = 0
				
				// LAÇO DE REPETIÇÃO PARA CONFIRMAR O NOME
				enquanto(confirmarNome != 1 e confirmarNome != 2){
					escreva("O NOME DO SEU PET SERÁ: ", nomePetCAlta, "\n",
					   "CONFIRME O NOME DIGITANDO 1.\n",
					   "PARA ALTERAR DIGITE 2.\n")
					leia(confirmarNome)
					limpa()
					se(confirmarNome != 1 e confirmarNome != 2){
           				 escreva("OPCAO INVALIDA!1\n")          			           	 			
        				}
				}													
			}
			
			// INICIO DO LOOP DO MENU //
			faca{					
				escreva("====== MENU ======\n",
					   "1-AVANCAR NO TEMPO\n",
					   "2-ALIMENTAR\n",
					   "3-JOGAR\n",
					   "4-DAR BANHO\n",
					   "5-VER STATUS\n",
					   "6-DESLIGAR")
					   
				escreva("\nESCOLHA UMA OPCAO DO MENU: \n")
				leia(menu)
				limpa() // LIMPEZA DE TELA
				
				escolha(menu){
					// ===== AVANÇAR TEMPO (+8 HORAS) ===== //
					caso 1:
						// AVANÇAR 8 HORAS E ADICIONAR +1 DIA CASO HORAS SEJA == 24
						horasDoDia = horasDoDia + 8  
						se(horasDoDia == 24){
							diasVivo = diasVivo + 1
							horasDoDia = 0
							}
											
						limpezaPet = limpezaPet - 2 // 2 Escolhido por mim pois não ta especifico no projeto, colocar condição ao tomar banho
						fomePet = fomePet + 2	//Colocar condicao ao alimentar    
					
						// FELICIDADE CAI, CASO PET ESTEJA MUITO SUJO
						se(limpezaPet <= 4){
							felicidadePet = felicidadePet - 1
						}
					
						// CONDIÇÕES PARA CURA DO PET
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
								escreva(nomePetCAlta, " SE CUROU!\n")
							}
						}senao{
							// CHANCE DO PET FICAR DOENTE DE 15%
							sorteio = u.sorteia(1, 100) 
							se(sorteio <= 15){                           
								doente = verdadeiro
								horasDoente = 0
								escreva(nomePetCAlta, " FICOU DOENTE!\n")
							}
						}
					
						// DEFININDO LIMITE DE FELICIDADE E LIMPEZA
						se(felicidadePet > 10){
							felicidadePet = 10
						}
						se(felicidadePet < 0){
							felicidadePet = 0
							}
						se(limpezaPet < 0){
							limpezaPet = 0
						}
					
						escreva("\nPressione enter para continuar!")
						leia(pausa)
						limpa()
					pare
					
					caso 2:
					pare

					// ====== BRINCAR ====== //
					caso 3:
						escreva("\nVAMOS JOGAR JOKENPO COM ", nomePetCAlta, "!\n")

						// LAÇO DE REPETIÇÃO CASO EMPATE, ATÉ DESEMPATAR
						enquanto(jogadaJogador == jogadaPet){
							escreva("1-PEDRA | 2-PAPEL | 3-TESOURA\n")
							escreva("QUAL SERA SUA JOGADA? ")
							leia(jogadaJogador)
					
							se(jogadaJogador < 1 ou jogadaJogador > 3){
								escreva("JOGADA INVALIDA! ESCOLHA 1, 2 OU 3.\n")
							}senao{
								jogadaPet = u.sorteia(1, 3)
								escreva("VOCE: ", jogadaJogador, " | ", nomePetCAlta, ": ", jogadaPet, "\n")
					
								se(jogadaJogador == jogadaPet){
									escreva("EMPATE! JOGUE NOVAMENTE...\n\n")
								}senao{
						
									// VITORIA E DERROTA DO PET
									se((jogadaPet == 1 e jogadaJogador == 3) ou (jogadaPet == 2 e jogadaJogador == 1) ou (jogadaPet == 3 e jogadaJogador == 2)){
										felicidadePet = felicidadePet + 5
										escreva(nomePetCAlta, " VOCE VENCEU! (+5 DE FELICIDADE).\n")
									}senao{
										felicidadePet = felicidadePet + 3
										escreva(nomePetCAlta, " PERDEU, MAS SE DIVERTIU! (+3 DE FELICIDADE).\n")
									}
								}
							}
						}
						// SE FELICIDADE FOR MAIOR QUE 10, ELA É DEFINIDA EM 10
						se(felicidadePet > 10){
							felicidadePet = 10
						}

						escreva("\nPressione enter para continuar!")
						leia(pausa)
						limpa()
					pare
					caso 4:
					pare
					// ===== STATUS DO PET ===== //
					caso 5:
						escreva("======= STATUS =======")
						escreva("\nDIAS VIVOS = ", diasVivo)
						escreva("\nFELICIDADE = ", felicidadePet)
						escreva("\nSUJEIRA = ", limpezaPet)
						escreva("\nFOME = ", fomePet)
						escreva("\n======================\n")
						
						escreva("\nPressione enter para continuar!")
						leia(pausa)
						limpa()
					pare
					caso 6:
						escreva("PROGRAMA DESLIGADO")  
					pare
					caso contrario:
						escreva("OPCAO INVALIDA!! DIGITE UMA OPCAO DE 1 A 6") 
					}	

					// == DISPARAR MENSAGEM CASO PET ESTEJA QUASE MORRENDO == //
					se(felicidadePet < 4){
						escreva(nomePetCAlta, " ESTÁ MUITO TRISTE!\n")	
					}
					se(limpezaPet < 4){
						escreva(nomePetCAlta, " ESTÁ MUITO SUJO!\n")	
					}
					se(fomePet > 6){
						escreva(nomePetCAlta, " ESTÁ COM FOME!\n")	
					}
					
					// == VERIFICA A CAUSA DA MORTE DO PET == //
					se(felicidadePet <= 0){
						vivo = falso
						limpa()
						escreva(nomePetCAlta," ESTAVA COM ", diasVivo, " DIAS VIVOS! MAS, INFELIZMENTE\n")
						escreva(nomePetCAlta, " MORREU DE TRISTEZA PRECOCEMENTE\n")
					}senao se(limpezaPet <= 0){
						vivo = falso
						limpa()
						escreva(nomePetCAlta," ESTAVA COM ", diasVivo, " DIAS VIVOS! MAS, INFELIZMENTE\n")
						escreva(nomePetCAlta, " MORREU DE SUJEIRA PRECOCEMENTE\n")
					}senao se(fomePet >= 10){
						vivo = falso
						limpa()
						escreva(nomePetCAlta," ESTAVA COM ", diasVivo, " DIAS VIVOS! MAS, INFELIZMENTE\n")
						escreva(nomePetCAlta, " MORREU DE FOME PRECOCEMENTE\n")
					}senao se(diasVivo >= 7){
						vivo = falso
						escreva("VOCE GANHOU!! O PET MORREU DE VELHICE")
					}
			}enquanto(menu != 6  e vivo)
							
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6308; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
