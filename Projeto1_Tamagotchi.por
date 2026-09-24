programa
{
	funcao inicio()
	{
		inteiro menu
		cadeia nomePet					
			
			escreva("DIGITE O NOME DO SEU PET: ")
			leia(nomePet)
			limpa()//Faz Uma Limpeza na tela
			faca{
				escreva("--MENU--\n1-AVANCAR NO TEMPO\n2-ALIMENTAR\n3-JOGAR\n4-DAR BANHO\n5-VER STATUS\n6-DESLIGAR")
				escreva("\nDIGITE UMA OPCAO DO MENU: ")
				leia(menu)
				limpa()

				//Verifica se a opcao digitada e igual a 6 de encerrar e mostra mensagem
				se(menu == 6){
					escreva("PROGRAMA DESLIGADO!!")
					}
			}enquanto((menu >= 1 ) e (menu < 6))				
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 433; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */