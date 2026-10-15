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
		
			escreva("=============================\n")
			escreva("BEM-VINDO AO SEU PET VIRTUAL\n")
			escreva("=============================\n")

			// RECEBER O NOME DO PET //
			enquanto(confirmarNome !=1){	
				
				escreva("DIGITE O NOME DO SEU PET: ")
				leia(nomePet)
				nomePetCAlta = t.caixa_alta(nomePet)
				limpa() //LIMPEZA DE TELA
				confirmarNome = 0
				
				// LAÇO DE REPETIÇÃO PARA CONFIRMAR O NOME
				enquanto(confirmarNome != 1 e confirmarNome != 2){
					escreva("================================\n")
					escreva("O NOME DO SEU PET SERÁ: ", nomePetCAlta, "\n",
					   "================================\n",
					   "CONFIRME O NOME DIGITANDO 1.\n",
					   "PARA ALTERAR DIGITE 2.\n")
					leia(confirmarNome)
					limpa()
					se(confirmarNome != 1 e confirmarNome != 2){
						escreva("================\n")
           				escreva("OPCAO INVALIDA!\n") 
           				escreva("================\n")         			           	 			
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
					   "6-DESLIGAR\n",
					   "===================")
					   
				escreva("\nESCOLHA UMA OPCAO DO MENU: \n")
				leia(menu)
				limpa() // LIMPEZA DE TELA
				
				escolha(menu){
					// ===== AVANÇAR TEMPO (+8 HORAS) ===== //
					caso 1:
						// AVANÇAR 8 HORAS E ADICIONAR +1 DIA CASO HORAS SEJA == 24
						escreva("===================================================\n")
						escreva("TEMPO AVANÇADO EM 8 HORAS! (-2 LIMPEZA, +2 FOME).\n")
						escreva("===================================================\n")
						horasDoDia = horasDoDia + 8  
						se(horasDoDia == 24){
							diasVivo = diasVivo + 1
							horasDoDia = 0
							}
											
						limpezaPet = limpezaPet - 2 // A CADA 8 HORAS O PET PERDE 2 DE LIMPEZA
						fomePet = fomePet + 2	// A CADA 8 HORAS O PET GANHA 2 DE FOME
						felicidadePet = felicidadePet - 2 // A CADA 8 HORAS O PET PERDE 2 DE FELICIDADE
					
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
					
						escreva("\nPRESSIONE ENTER PARA CONTINUAR!")
						leia(pausa)
						limpa()
					pare
					
					caso 2:									
						se(fomePet == 0){
							// ALIMENTAR QUANDO TIVER SEM FOME
							felicidadePet = felicidadePet - 2
							escreva("=======================================================\n")
							escreva(nomePetCAlta, " NAO ESTAVA COM FOME! (-2 DE FELICIDADE).\n")	
							escreva("=======================================================\n")					
						}senao{
							fomePet = fomePet - 4
							se(fomePet < 0){
								fomePet = 0
							}
						felicidadePet = felicidadePet + 1 // valor escolhido por mim
						escreva("========================================================\n")
        					escreva(nomePetCAlta, " COMEU! FOME ATUAL: ", fomePet, " (-4 FOME, +1 FELICIDADE).\n")
        					escreva("========================================================\n")
						}

						//AO AUMENTAR A FELICIDADE SE PASSAR DOS LIMITE, FAZ RECEBER VALOR PRA NAO ULTRAPASSAR LIMITE
						se(felicidadePet > 10){
							felicidadePet = 10
							}
						 se(felicidadePet < 0){
						     felicidadePet = 0
							}
						
						escreva("\nPRESSIONE ENTER PARA CONTINUAR!")
    						leia(pausa)
    						limpa()
					pare					
					// ====== BRINCAR ====== //
					caso 3:
						escreva("=====================================\n")
						escreva("VAMOS JOGAR JOKENPO COM ", nomePetCAlta, "!\n")
						jogadaJogador = 0
						jogadaPet = 0

						// LAÇO DE REPETIÇÃO CASO EMPATE, ATÉ DESEMPATAR
						enquanto(jogadaJogador == jogadaPet){
							escreva("1-PEDRA | 2-PAPEL | 3-TESOURA\n")
							escreva("=====================================\n")
							escreva("QUAL SERA SUA JOGADA? ")
							leia(jogadaJogador)
					
							se(jogadaJogador < 1 ou jogadaJogador > 3){
								limpa()
								escreva("=====================================\n")
								escreva("JOGADA INVALIDA! ESCOLHA 1, 2 OU 3.\n")
								escreva("=====================================\n")
								jogadaJogador = 0
								jogadaPet = 0
							}senao{
								jogadaPet = u.sorteia(1, 3)
								limpa()
								escreva("VOCE: ", jogadaJogador, " | ", nomePetCAlta, ": ", jogadaPet, "\n")
					
								se(jogadaJogador == jogadaPet){
									
									escreva("EMPATE! JOGUE NOVAMENTE...\n")
									escreva("=====================================\n")
								}senao{
						
									// VITORIA E DERROTA DO PET
									se((jogadaPet == 1 e jogadaJogador == 3) ou (jogadaPet == 2 e jogadaJogador == 1) ou (jogadaPet == 3 e jogadaJogador == 2)){
										felicidadePet = felicidadePet + 5
										escreva("=====================================\n")
										escreva(nomePetCAlta, " VOCE VENCEU! (+5 DE FELICIDADE).\n")
										escreva("=====================================\n")
									}senao{
										felicidadePet = felicidadePet + 3
										escreva("===============================================\n")
										escreva(nomePetCAlta, " PERDEU, MAS SE DIVERTIU! (+3 DE FELICIDADE).\n")
										escreva("===============================================\n")
									}
								}
							}
						} // FIM ENQUANTO 
						
						// SE FELICIDADE FOR MAIOR QUE 10, ELA É DEFINIDA EM 10
						se(felicidadePet > 10){
							felicidadePet = 10
						}

						escreva("\nPRESSIONE ENTER PARA CONTINUAR!")
						leia(pausa)
						limpa()
					pare
					// ====== DAR BANHO ===== //
					caso 4:
						se(limpezaPet == 10){
							escreva("===================================\n")
							escreva(nomePetCAlta, " JÁ ESTÁ LIMPO! (-6 FELICIDADE)\n")
							escreva("===================================\n")
							felicidadePet = felicidadePet - 6
							se(felicidadePet < 0){
								felicidadePet = 0	
							}	
						}senao{
						limpezaPet = 10
						escreva("=======================================\n")
						escreva(nomePetCAlta," AGORA ESTÁ LIMPO! (LIMPEZA = 10)\n")
						escreva("=======================================\n")
						}

						escreva("\nPRESSIONE ENTER PARA CONTINUAR!")
						leia(pausa)
						limpa()
					pare
					// ===== STATUS DO PET ===== //
					caso 5:
						escreva("======= STATUS =======")
						escreva("\nDIAS VIVOS = ", diasVivo)
						
						escreva("\nFELICIDADE = ", felicidadePet)
						escreva("\nLIMPEZA = ", limpezaPet)
						escreva("\nFOME = ", fomePet)
						se(doente){
							escreva("\nDOENTE = SIM")
						}senao{
						     escreva("\nDOENTE = NAO")
						    }
						escreva("\n======================\n")
						
						escreva("\nPRESSIONE ENTER PARA CONTINUAR!")
						leia(pausa)
						limpa()
					pare
					caso 6:
						escreva("===================\n")
						escreva("PROGRAMA DESLIGADO\n") 
						escreva("===================\n") 
					pare
					caso contrario:
						escreva("========================================\n")
						escreva("OPCAO INVALIDA!! DIGITE UMA OPCAO DE 1 A 6\n") 
						escreva("========================================\n")
					} // FIM ESCOLHA

					// == DISPARAR MENSAGEM CASO PET ESTEJA QUASE MORRENDO == 
					se(felicidadePet < 4){
						escreva(nomePetCAlta, " ESTÁ MUITO TRISTE!\n")	
					}
					se(limpezaPet < 4){
						escreva(nomePetCAlta, " ESTÁ MUITO SUJO!\n")	
					}
					se(fomePet > 6){
						escreva(nomePetCAlta, " ESTÁ COM FOME!\n")	
					}
					
					// == VERIFICA A CAUSA DA MORTE DO PET == 
					se(felicidadePet <= 0 ou limpezaPet <= 0 ou fomePet >= 10){
						vivo = falso
						limpa()
						escreva(nomePetCAlta, " ESTAVA COM ", diasVivo, " DIAS VIVOS! MAS, INFELIZMENTE MORREU\n")

						se(felicidadePet <= 0){
							escreva(nomePetCAlta, " MORREU DE TRISTEZA\n")
						}
						se(limpezaPet <= 0){
							escreva(nomePetCAlta, " MORREU DE SUJEIRA\n")
						}
						se(fomePet >= 10){
							escreva(nomePetCAlta, " MORREU DE FOME\n")
						}
					}senao se(diasVivo >= 7){
						vivo = falso
						limpa()
						escreva("====================================\n")
						escreva("VOCE GANHOU!! O PET MORREU DE VELHICE\n")
						escreva("====================================\n")
					}
				
			}enquanto(menu != 6  e vivo)
							
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 10446; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */