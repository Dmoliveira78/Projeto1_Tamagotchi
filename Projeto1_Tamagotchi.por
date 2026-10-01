programa{
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	
	funcao inicio(){
		inteiro menu // menu principal
		inteiro confirmarNome = 0 //confirmação do nome do pet
		inteiro diasVivo = 0 //Maximo 7 dias de vida, a cada 24hrs envelhece 1 dia
		inteiro felicidade = 5// Comer, brincar e dormir aumenta, maximo 10 se chegar a 0 morre, Pet vencer aumenta em 5 e caso perder aumenta em 3
		inteiro limpezaPet = 10// Ao passar o tempo diminui, chegar em 0 morre
		inteiro fomePet = 0 //Passar tempo a fome aumenta, alimentar diminui 4 pontos de fome, se tiver em 0 a fome e alimentar a felicidade diminui em 2
		logico doente = falso //Pet incia saudavel
		logico vivo = verdadeiro //Pet inicia vivo
		cadeia nomePet	//nome do pet
		cadeia nomePetCAlta //transoforma o nome do pet em caixa alta
			
			
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
					pare
					caso 2:
					pare
					caso 3:
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
 * @POSICAO-CURSOR = 890; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */