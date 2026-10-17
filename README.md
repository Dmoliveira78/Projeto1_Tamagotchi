➡️ 🐎 **Bichinho Virtual — Tamagotchi Spirit**

Alan Felipe Vaz e Silva : https://github.com/AlanFelpVaz
Daniel Maciel De Oliveira : https://github.com/Dmoliveira78
Thainá Garcia Gonçalves: https://github.com/thgargon

Projeto 1 da disciplina **Conceitos de Algoritmos** (1º Período — Tecnologia em Análise e Desenvolvimento de Sistemas), desenvolvido em **Portugol Studio**.

O programa é inspirado no Tamagotchi de 1996 e simula um bichinho virtual. O jogador escolhe o nome do pet e deve cuidar da sua fome, limpeza e felicidade para mantê-lo vivo por até sete dias.

➡️**Como rodar**

1. Abra o arquivo no Portugol Studio.
2. Aperte em Executar.
3. Siga o que aparece na tela.

➡️**Como o Pet Funciona**

O Pet possui três status principais:
✔️ FELICIDADE: começa em 5, vai de 0 a 10. Se chegar a 0, o pet morre de tristeza.
✔️ LIMPEZA: começa em 10, vai de 0 a 10. Se chegar a 0, o pet morre de sujeira.
✔️ FOME: começa em 0, vai de 0 a 10. Se chegar a 10, o pet morre de fome.

Além disso o pet pode ficar do doente do nada (isso pode acontecer toda vez que o tempo avança) e ele se cura sozinha depois de um tempo. Se o pet sobreviver por 7 dias, o jogador ganha o jogo e o pet morre de velhice.

➡️**Menu**

<img width="476" height="251" alt="image" src="https://github.com/user-attachments/assets/5d8c8890-e0a5-4e0f-a536-784a3c3fde2f" />

➡️**O que cada parte do código faz**

**Cadastro do nome:** no começo o programa pede o nome do pet. Depois mostra o nome em maiúsculo e pede para confirmar (digitando 1) ou trocar (digitando 2). Enquanto a pessoa não confirma, ele fica pedindo de novo, por isso tem dois <img width="86" height="25" alt="image" src="https://github.com/user-attachments/assets/9a85712e-a98f-49c6-bb3a-613a61a012b3" />
 um dentro do outro: um para digitar o nome o outro só para confirmar. 
O nome é transformado em caixa alta com _t.caixa_alta()_ e guardado em nomePetCAlta, que é usado em todas as falas do jogo daqui para frente.

**O laço do menu:** O menu fica dentro de um <img width="47" height="22" alt="image" src="https://github.com/user-attachments/assets/20594ca6-5c4f-444b-bdc1-26337d33cd49" /> ... <img width="87" height="23" alt="image" src="https://github.com/user-attachments/assets/e5697adf-d5a3-4806-ba1e-240cd3103333" />, que faz o menu aparecer pelo menos uma vez e continuar se repetindo até o jogador escolher "Desligar" ou pet morrer. A condição que para o laço é   <img width="185" height="36" alt="image" src="https://github.com/user-attachments/assets/e74f8f0e-1cab-421f-8efd-bb8fd9a39309" />

_**Opção 1 - Avançar no tempo:**_ Cada vez que essa opção é escolhida, o tempo passa 8 horas. Isso muda várias coisas:
A cada 24h aculadas, conta maus um dia de vida.
A limpeza cai 2 pontos e a fome sobe 2 pontos.
A felicidade cai 2 pontos e cai mais 1 se a limpeza já estiver muito baixa (4 ou menos).
Se o pet já está doente, soma 8h no tempo de doença e sorteia a chance de cura (33,3% com 8h, 66,6% com 16h, cura garantida 100% com 24h ou mais).
Se o pet não está doente, tem 15% de chance dele ficar doente nessa rodada.

No final, o código trava felicidade e limpeza pra não passarem dos limetes (não deixa ir abaixo de 0, por exemplo).

_**Opção 2 - Alimentar:**_ Se o pet já está sem fome (fome=0) e o jogador tenta alimentar mesmo assim, o pet fica chateado e perde 2 de felicidade. Se ele está com fome, a fome cai 4 pontos e a felicidade sobe 1, por que ele gostou de comer.

_**Opção 3 - Jogar (Jokenpô):**_ O pet joga pedra, papel e tesoura com jogador. O jogador digita a jogada (1,2 ou 3) e o comuputador sorteia a jogada do pet. Se der empate, o jogo repete sozinho até sair um vencedor, isso é feito com um  <img width="87" height="22" alt="image" src="https://github.com/user-attachments/assets/9d7791e4-d950-4911-a90b-f9ca74e50213" />  que só para quando as jogadas são diferentes. Se o pet ganhar, a felicidade sobe 5. Se perder, sobe 3 mesmo assim, porque ele se divertiu de qualquer forma.

_**Opção 4 - Dar banho:**_ Se a limpeza já está no máximo (10) e o jogador dá banho mesmo assim, o pet não gosta e perde 6 de felicidade. Se não está limpo, a limpeza volta pro máximo.

_**Opção 5 - Ver status:**_ Mostra na tela os dias de vida, a felicidade, a limpeza, a fome e se pet está doente ou não.

_**Opção 6 - Desligar:**_ Encerra o jogo, porque faz a condição <img width="98" height="20" alt="image" src="https://github.com/user-attachments/assets/88eaabbc-77f1-4118-b525-97913e83e1fb" /> do laço principal ficar falsa.

**Avisos e verificação de morte:** Depois de qualquer opção esoclhida, o programa checa três coisas e avisa se precisar: se a felicidade está baixa, se a limpeza está baixa, ou se a fome está alta. Isso serve para o jogador saber que precisa cuidar do pet antes que seja tarde. Logo depois vem a parte que decide se o jogo acabou:

Se a felicidade chegou a 0, ou a limpeza chegou a 0, ou a fome chegou a 10, o pet morre e o jogo mostra a causa da morte.
Se nenhuma dessas coisas aconteceu e o pet já completou 7 dias de vida, o jogador ganha o jogo.

Em qualquer um dos dois casos a variável  _vivo_ vira falso, e isso encerra o laço do menu na próxima verificação.

➡️**Valores que definimos**

- Chance do pet ficar doente ao avançar o tempo: 15%
- Quanto a felicidade sobe ao comer com fome: +1
- Quanto a felicidade cai quando o pet fica muito tempo sujo: -1, além da queda normal de -2 por passar o tempo.












