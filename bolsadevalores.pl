/*
* Bolsa de Valores - Problema de Lógica
Cinco investidores estão lado a lado conversando sobre investimentos no
mercado de ações. Cada um tem um montante investido e um setor
favorito de empresas listadas na bolsa de valores.
Siga as dicas e use a lógica para descobrir quem gosta do setor petroquímico.
* São:
*   05 colunas
*   06 linhas
*   20 instruções
* Fonte: https://rachacuca.com.br/logica/problemas/bolsa-de-valores/
*/

%FATOS - O QUE TEM DE BASE DE DADOS?

%GRAVATAS
gravata(amarela).
gravata(branca).
gravata(verde).
gravata(azul).
gravata(vermelha).

%NOMES
nome(claudio).
nome(diego).
nome(joao).
nome(ronaldo).
nome(wagner).

%SETOR
setor(energia).
setor(mineracao).
setor(petroquimico).
setor(tecnologia).
setor(varejo).

%INVESTIMENTO
investimento(i5000).
investimento(i10000).
investimento(i15000).
investimento(i20000).
investimento(i25000).

%IDADE

idade(a40).
idade(a45).
idade(a50).
idade(a55).
idade(a60).

%PROFISSÃO

profissao(arquiteto).
profissao(bancario).
profissao(corretor).
profissao(delegado).
profissao(professor).


%ESTABELECENDO A REGRA DO ALLDIFFERENT
alldifferent([]).
alldifferent([Elemento|Lista]):-
      not(member(Elemento,Lista)),
      alldifferent(Lista).

%ESTABELECENDO O MODELO

modelo([
    (Gravata_1, Nome_1, Setor_1, Investimento_1, Idade_1, Profissao_1),
    (Gravata_2, Nome_2, Setor_2, Investimento_2, Idade_2, Profissao_2),
    (Gravata_3, Nome_3, Setor_3, Investimento_3, Idade_3, Profissao_3),
    (Gravata_4, Nome_4, Setor_4, Investimento_4, Idade_4, Profissao_4),
    (Gravata_5, Nome_5, Setor_5, Investimento_5, Idade_5, Profissao_5)
       ]) :-

%ANALISANDO AS INSTRUÇÕES DO PROBLEMA

%SETORES
setor(Setor_1),
setor(Setor_2),
setor(Setor_3),
setor(Setor_4),
setor(Setor_5),

alldifferent([Setor_1, Setor_2, Setor_3, Setor_4, Setor_5]),

%12) Na quarta posição está o homem que investe em empresas do setor de Mineração.

(Setor_4==mineracao),

%GRAVATAS
gravata(Gravata_1),
gravata(Gravata_2),
gravata(Gravata_3),
gravata(Gravata_4),
gravata(Gravata_5),


%17) O homem de gravata Verde está em algum lugar entre o homem de gravata Azul e o homem de gravata Vermelha, nessa ordem.

(
(Gravata_1==azul, (Gravata_2==verde; Gravata_3==verde; Gravata_4==verde), Gravata_5==vermelha);
(Gravata_1==azul, (Gravata_2==verde; Gravata_3==verde), Gravata_4==vermelha);
(Gravata_1==azul, (Gravata_2==verde), Gravata_3==vermelha);
(Gravata_2==azul, (Gravata_3==verde; Gravata_4==verde), Gravata_5==vermelha);
(Gravata_2==azul, (Gravata_3==verde), Gravata_4==vermelha);
(Gravata_3==azul, (Gravata_4==verde), Gravata_5==vermelha)),

%11)O investidor de gravata Branca gosta de empresas do setor Mineração.

(
(Gravata_1==branca, Setor_1==mineracao);
(Gravata_2==branca, Setor_2==mineracao);
(Gravata_3==branca, Setor_3==mineracao);
(Gravata_4==branca, Setor_4==mineracao);
(Gravata_5==branca, Setor_5==mineracao)),

alldifferent([Gravata_1, Gravata_2, Gravata_3, Gravata_4, Gravata_5]),

%IDADE
idade(Idade_1),
idade(Idade_2),
idade(Idade_3),
idade(Idade_4),
idade(Idade_5),

%20) O investidor de gravata Amarela tem 45 anos.

(
(Gravata_1==amarela, Idade_1==a45);
(Gravata_2==amarela, Idade_2==a45);
(Gravata_3==amarela, Idade_3==a45);
(Gravata_4==amarela, Idade_4==a45);
(Gravata_5==amarela, Idade_5==a45)),

alldifferent([Idade_1, Idade_2, Idade_3, Idade_4, Idade_5]),

%10) O homem de 50 anos está em algum lugar à direita do homem de gravata Azul.

(
(Idade_2==a50, Gravata_1==azul);
(Idade_3==a50, (Gravata_1==azul; Gravata_2==azul));
(Idade_4==a50, (Gravata_1==azul; Gravata_2==azul; Gravata_3==azul));
(Idade_5==a50, (Gravata_1==azul; Gravata_2==azul; Gravata_3==azul; Gravata_4==azul))),

%NOME
nome(Nome_1),
nome(Nome_2),
nome(Nome_3),
nome(Nome_4),
nome(Nome_5),

%5) O homem de gravata Azul está em algum lugar entre o Wagner e o homem que tem R$ 5000 de investimento na bolsa, nessa ordem.

(
(Nome_1==wagner, (Gravata_2==azul; Gravata_3==azul; Gravata_4==azul), Investimento_5==i5000);
(Nome_1==wagner, (Gravata_2==azul; Gravata_3==azul), Investimento_4==i5000);
(Nome_1==wagner, Gravata_2==azul, Investimento_3==i5000);
(Nome_2==wagner, (Gravata_3==azul; Gravata_4==azul), Investimento_5==i5000);
(Nome_2==wagner, Gravata_3==azul, Investimento_4==i5000);
(Nome_3==wagner,  Gravata_4==azul, Investimento_5==i5000)),

%9) Wagner está exatamente à esquerda do investidor de 55 anos.

(
(Nome_1==wagner, Idade_2==a55);
(Nome_2==wagner, Idade_3==a55);
(Nome_3==wagner, Idade_4==a55);
(Nome_4==wagner, Idade_5==a55)),

alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),


%PROFISSAO
profissao(Profissao_1),
profissao(Profissao_2),
profissao(Profissao_3),
profissao(Profissao_4),
profissao(Profissao_5),

%1) O Bancário gosta de empresas do setor de Energia.
(
(Profissao_1==bancario, Setor_1==energia);
(Profissao_2==bancario, Setor_2==energia);
(Profissao_3==bancario, Setor_3==energia);
(Profissao_4==bancario, Setor_4==energia);
(Profissao_5==bancario, Setor_5==energia)),

alldifferent([Profissao_1, Profissao_2, Profissao_3, Profissao_4, Profissao_5]),

%7) O Professor tem 50 anos.

(
(Profissao_1==professor, Idade_1==a50);
(Profissao_2==professor, Idade_2==a50);
(Profissao_3==professor, Idade_3==a50);
(Profissao_4==professor, Idade_4==a50);
(Profissao_5==professor, Idade_5==a50)),


%16) Wagner é Arquiteto.

(
(Nome_1==wagner, Profissao_1==arquiteto);
(Nome_2==wagner, Profissao_2==arquiteto);
(Nome_3==wagner, Profissao_3==arquiteto);
(Nome_4==wagner, Profissao_4==arquiteto);
(Nome_5==wagner, Profissao_5==arquiteto)),

%18) João está ao lado do Corretor.

(
(Nome_1==joao, Profissao_2==corretor);
(Nome_2==joao, (Profissao_1==corretor; Profissao_3==corretor));
(Nome_3==joao, (Profissao_2==corretor; Profissao_4==corretor));
(Nome_4==joao, (Profissao_3==corretor; Profissao_5==corretor));
(Nome_5==joao, Profissao_4==corretor)),

%4) Cláudio está ao lado do investidor que gosta do setor de Varejo.

(
(Nome_1==claudio, Setor_2==varejo);
(Nome_2==claudio, (Setor_1==varejo; Setor_3==varejo));
(Nome_3==claudio, (Setor_2=varejo; Setor_4==varejo));
(Nome_4==claudio, (Setor_3==varejo; Setor_5==varejo));
(Nome_5==claudio, Setor_4==varejo)),


%INVESTIMENTO
investimento(Investimento_1),
investimento(Investimento_2),
investimento(Investimento_3),
investimento(Investimento_4),
investimento(Investimento_5),

%2) Diego está ao lado do homem que tem o maior investimento na bolsa.

(
(Nome_1==diego, Investimento_2==i25000);
(Nome_2==diego, (Investimento_1==i25000; Investimento_3==i25000));
(Nome_3==diego, (Investimento_2==i25000; Investimento_4==i25000));
(Nome_4==diego, (Investimento_3==i25000; Investimento_5==i25000));
(Nome_5==diego, Investimento_4==i25000)),

alldifferent([Investimento_1, Investimento_2, Investimento_3, Investimento_4, Investimento_5]),

%3) O homem mais novo tem R$ 20000 investido na bolsa.

(
(Idade_1==a40, Investimento_1==i20000);
(Idade_2==a40, Investimento_2==i20000);
(Idade_3==a40, Investimento_3==i20000);
(Idade_4==a40, Investimento_4==i20000);
(Idade_5==a40, Investimento_5==i20000)),


%6) O Delegado tem R$ 10000 de investimento na bolsa de valores.

(
(Profissao_1==delegado, Investimento_1==i10000);
(Profissao_2==delegado, Investimento_2==i10000);
(Profissao_3==delegado, Investimento_3==i10000);
(Profissao_4==delegado, Investimento_4==i10000);
(Profissao_5==delegado, Investimento_5==i10000)),


%8) Quem tem R$ 10000 investido está em algum lugar entre quem está de gravata Amarela e quem está de gravata Branca, nessa ordem.

(
(Gravata_1==amarela, (Investimento_2==i10000; Investimento_3==i10000; Investimento_4==i10000), Gravata_5==branca);
(Gravata_1==amarela, (Investimento_2==i10000; Investimento_3==i10000), Gravata_4==branca);
(Gravata_1==amarela, Investimento_2==i10000, Gravata_3==branca);
(Gravata_2==amarela, (Investimento_3==i10000; Investimento_4==i10000), Gravata_5==branca);
(Gravata_2==amarela, Investimento_3==i10000, Gravata_4==branca);
(Gravata_3==amarela, Investimento_4==i10000, Gravata_5==branca)),


%13) O Corretor tem R$ 5000 de investimento no mercado de ações.

(
(Profissao_1==corretor, Investimento_1==i5000);
(Profissao_2==corretor, Investimento_2==i5000);
(Profissao_3==corretor, Investimento_3==i5000);
(Profissao_4==corretor, Investimento_4==i5000);
(Profissao_5==corretor, Investimento_5==i5000)),

%14) O investidor de gravata Azul está ao lado do investidor que tem R$ 20000 de investimento na bolsa.

(
(Gravata_1==azul, Investimento_2==i20000);
(Gravata_2==azul, (Investimento_1==i20000; Investimento_3==i20000));
(Gravata_3==azul, (Investimento_2==i20000; Investimento_4==i20000));
(Gravata_4==azul, (Investimento_3==i20000; Investimento_5==i20000));
(Gravata_5==azul, Investimento_4==i20000)),

% 15) Quem gosta do setor de Tecnologia está exatamente à direita de quemtem R$ 15000 em renda variável.

(
(Setor_2==tecnologia, Investimento_1==i15000);
(Setor_3==tecnologia, Investimento_2==i15000);
(Setor_4==tecnologia, Investimento_3==i15000);
(Setor_5==tecnologia, Investimento_4==i15000)),


%19) O homem mais velho está exatamente à direita do homem que tem R$ 15000 de investimento na bolsa.

(
(Idade_2==a60, Investimento_1==i15000);
(Idade_3==a60, Investimento_2==i15000);
(Idade_4==a60, Investimento_3==i15000);
(Idade_5==a60, Investimento_4==i15000)),


nl,%insere uma nova linha (coloca o cursor no início da linha de baixo)
write('CHEGAMOS AO FIM DO MODELO')
.% fechando o modelo

%%%%%%%%%%%%%%%%%%%%%%%% Imprimindo a lista
imprime_lista([]):- write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]):-
	write('\n......................................\n'),
	write(H), write(' : '),
              imprime_lista(T).

/**********************************************************/
%% main fornece ponto de entrada para scripts
main :-
   %% statistics mostra informações sobre o uso de recursos
   %% Obtém o tempo inicial baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime,Tempo_inicial),

    %%chama modelo
    %% lembrando que modelo foi definido como:
    %%  modelo([
    %%     (Biquini_1, Nome_1, Protetor_1, Picole_1, Idade_1, Hobby_1),
    %%     (Biquini_2, Nome_2, Protetor_2, Picole_2, Idade_2, Hobby_2),
    %%     (Biquini_3, Nome_3, Protetor_3, Picole_3, Idade_3, Hobby_3),
    %%     (Biquini_4, Nome_4, Protetor_4, Picole_4, Idade_4, Hobby_4),
    %%     (Biquini_5, Nome_5, Protetor_5, Picole_5, Idade_5, Hobby_5)
    %%  ])

    modelo(  [Coluna1, Coluna2, Coluna3, Coluna4,Coluna5]  ),

    %%chama imprime_lista
    imprime_lista(  [Coluna1, Coluna2, Coluna3, Coluna4, Coluna5]  ),

    %% Obtém o tempo final baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime ,Tempo_final),
    Tempo_BUSCA is Tempo_final - Tempo_inicial,

    %%define o formato do tempo na saída
    format('\n Tempo inicial: ~f \t Tempo final: ~f  msec', [Tempo_inicial, Tempo_final]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA),
    fail.
main :-

    nl,
    write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
    nl,
    write('........ UFA apos o fail .......').
