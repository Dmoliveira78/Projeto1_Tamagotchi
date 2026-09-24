programa{
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	
	funcao inicio(){
		inteiro menu // menu principal
		inteiro confirmarNome = 0 // confirmação do nome do pet
		cadeia nomePet	// nome do pet
		cadeia nomePetCAlta // transoforma o nome do pet em caixa alta
			
			
			escreva("BEM-VINDO AO SEU PET VIRTUAL\n")

			// confirmar o nome digitado ::::
			enquanto(confirmarNome !=1){	
				
				escreva("DIGITE O NOME DO SEU PET: ")
				leia(nomePet)
				nomePetCAlta = t.caixa_alta(nomePet)
				limpa() //Faz Uma Limpeza na tela
				
				escreva("O NOME DO PET SERÁ: ", nomePetCAlta, "\n",
					   "CONFIRME O NOME DIGITANDO 1.\n",
					   "PARA ALTERAR DIGITE QUALQUER OUTRO NUMERO.\n")
				leia(confirmarNome)
				limpa() //Faz Uma Limpeza na tela
					
			}
			
			// inicio do loop do pet ::::
			faca{
				limpa() //Faz Uma Limpeza na tela
				
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

				//Verifica se a opcao digitada e igual a 6 de encerrar e mostra mensagem
				se(menu == 6){
					escreva("PROGRAMA DESLIGADO!!")
					}
			// condição
			}enquanto((menu >= 1 ) e (menu < 6))				
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1113; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */