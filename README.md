➡️ 🐎 **Bichinho Virtual — Tamagotchi Spirit**

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







Alan : https://github.com/AlanFelpVaz
Daniel : https://github.com/Dmoliveira78
Thainá : https://github.com/thgargon
