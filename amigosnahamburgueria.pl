/*
 * Amigos na Hamburgueria - Problema de Lógica
 * Cinco amigo estão lado a lado em uma hamburgueria. Cada um está
 * bebendo uma cerveja e pediu um hambúrguer. Use a lógica para
 * descobrir qual hambúrguer cada um pediu, a cerveja que cada um está
 * bebendo e qual é o esporte favorito de cada um dos amigos.
 *  São:
 *    05 colunas
 *    06 linhas
 *    19 instruções
 * Fonte: https://rachacuca.com.br/logica/problemas/amigos-na-hamburgueria/
 */

 %%%%% BASE DE DADOS

 %%% CAMISETA
camiseta(amarela).
camiseta(azul).
camiseta(branca).
camiseta(verde).
camiseta(vermelha).

 %%% NOME
nome(antonio).
nome(daniel).
nome(evaristo).
nome(paulo).
nome(vinicius).

 %%% HAMBURGUER
hamburguer(baconextra).
hamburguer(bempassado).
hamburguer(onionrings).
hamburguer(semalface).
hamburguer(semcebola).

 %%% CERVEJA
cerveja(alema).
cerveja(belga).
cerveja(holandesa).
cerveja(irlandesa).
cerveja(inglesa).

 %%% IDADE
idade(a26).
idade(a28).
idade(a30).
idade(a32).
idade(a34).

 %%% ESPORTE
esporte(basquete).
esporte(corrida).
esporte(futebol).
esporte(surfe).
esporte(volei).

 %%% REGRA DO ALLDIFFERENT
alldifferent([]).
alldifferent([Elemento|Lista]):-
    not(member(Elemento,Lista)),
    alldifferent(Lista).

 %%% ESTABELECENDO O MODELO

modelo([
        (Camiseta_1, Nome_1, Hamburguer_1, Cerveja_1, Idade_1, Esporte_1),
        (Camiseta_2, Nome_2, Hamburguer_2, Cerveja_2, Idade_2, Esporte_2),
        (Camiseta_3, Nome_3, Hamburguer_3, Cerveja_3, Idade_3, Esporte_3),
        (Camiseta_4, Nome_4, Hamburguer_4, Cerveja_4, Idade_4, Esporte_4),
        (Camiseta_5, Nome_5, Hamburguer_5, Cerveja_5, Idade_5, Esporte_5)
       ]) :-

%%% ANALISANDO AS SITUAÇÕES DO PROBLEMA

%%%% HAMBURGUER
hamburguer(Hamburguer_1),
hamburguer(Hamburguer_2),
hamburguer(Hamburguer_3),
hamburguer(Hamburguer_4),
hamburguer(Hamburguer_5),

%%% 08)Na terceira posição está quem pediu um hambúrguer com Bacon extra.

(Hamburguer_3==baconextra),

alldifferent([Hamburguer_1, Hamburguer_2, Hamburguer_3, Hamburguer_4, Hamburguer_5]),

%%%% CAMISETA
camiseta(Camiseta_1),
camiseta(Camiseta_2),
camiseta(Camiseta_3),
camiseta(Camiseta_4),
camiseta(Camiseta_5),

%%% 11)O amigo que pediu um hambúrguer com Onion rings está ao lado do amigo de camiseta Verde.

(
(Hamburguer_5==onionrings, Camiseta_4==verde);
(Hamburguer_4==onionrings, (Camiseta_3==verde; camiseta_5==verde));
(Hamburguer_3==onionrings, (Camiseta_2==verde; camiseta_4==verde));
(Hamburguer_2==onionrings, (Camiseta_1==verde; camiseta_3==verde));
(Hamburguer_1==onionrings, Camiseta_2==verde)),

alldifferent([Camiseta_1, Camiseta_2, Camiseta_3, Camiseta_4, Camiseta_5]),

%%%% ESPORTE
esporte(Esporte_1),
esporte(Esporte_2),
esporte(Esporte_3),
esporte(Esporte_4),
esporte(Esporte_5),

%%% 12)Quem gosta de Surfe está na quinta posição.

(Esporte_5==surfe),

alldifferent([Esporte_1, Esporte_2, Esporte_3, Esporte_4, Esporte_5]),


%%%% IDADE
idade(Idade_1),
idade(Idade_2),
idade(Idade_3),
idade(Idade_4),
idade(Idade_5),

%%% 03)Na quarta posição está o homem de 30 anos.

(Idade_4==a30),

alldifferent([Idade_1, Idade_2, Idade_3, Idade_4, Idade_5]),


%%%% CERVEJA
cerveja(Cerveja_1),
cerveja(Cerveja_2),
cerveja(Cerveja_3),
cerveja(Cerveja_4),
cerveja(Cerveja_5),

%%% 05) O homem de camiseta Vermelha está bebendo a cerveja Inglesa.

(
(Camiseta_1==vermelha, Cerveja_1==inglesa);
(Camiseta_2=vermelha, Cerveja_2==inglesa);
(Camiseta_3==vermelha, Cerveja_3==inglesa);
(Camiseta_4==vermelha, Cerveja_4==inglesa);
(Camiseta_5==vermelha, Cerveja_5==inglesa)),

%%% 13)O homem de Verde está bebendo a cerveja Holandesa.

(
(Camiseta_1==verde, Cerveja_1==holandesa);
(Camiseta_2=verde, Cerveja_2==holandesa);
(Camiseta_3==verde, Cerveja_3==holandesa);
(Camiseta_4==verde, Cerveja_4==holandesa);
(Camiseta_5==verde, Cerveja_5==holandesa)),

alldifferent([Cerveja_1, Cerveja_2, Cerveja_3, Cerveja_4, Cerveja_5]),

%%% 19)Evaristo está ao lado do homem de camiseta Azul.

%%%% NOME
nome(Nome_1),
nome(Nome_2),
nome(Nome_3),
nome(Nome_4),
nome(Nome_5),

(
(Nome_1==evaristo, Camiseta_2==azul);
(Nome_2==evaristo, (Camiseta_1==azul; Camiseta_3==azul));
(Nome_3==evaristo, (Camiseta_2==azul; Camiseta_4==azul));
(Nome_4==evaristo, (Camiseta_3==azul; Camiseta_5==azul));
(Nome_5==evaristo, Camiseta_4==azul)),

alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),

%%% 02)Daniel está exatamente à esquerda do amigo de 28 anos.

(
(Nome_1==daniel, Idade_2==a28);
(Nome_2==daniel, Idade_3==a28);
(Nome_3==daniel, Idade_4==a28);
(Nome_4==daniel, Idade_5==a28)),

%%% 07) O homem mais velho está ao lado do homem que está bebendo a cerveja Belga.

(
(Idade_1==a34, Cerveja_2==belga);
(Idade_2==a34, Cerveja_3==belga);
(Idade_3==a34, Cerveja_4==belga);
(Idade_4==a34, Cerveja_5==belga);
(Idade_5==a34, Cerveja_4==belga)),

%%% 14) O amigo mais novo está exatamente à esquerda do homem de 30 anos.

(
(Idade_1==a26, Idade_2==a30);
(Idade_2==a26, Idade_3==a30);
(Idade_3==a26, Idade_4==a30);
(Idade_4==a26, Idade_5==a30)),

%%% 18) Vinicius está exatamente à esquerda de quem pediu um hambúrguer Sem cebola.

(
(Nome_1==vinicius, Hamburguer_2==semcebola);
(Nome_2==vinicius, Hamburguer_3==semcebola);
(Nome_3==vinicius, Hamburguer_4==semcebola);
(Nome_4==vinicius, Hamburguer_5==semcebola)),

%%% 10)Quem gosta de Corrida está exatamente à esquerda de quem gosta de Basquete.

(
(Esporte_1==corrida, Esporte_2==basquete);
(Esporte_2==corrida, Esporte_3==basquete);
(Esporte_3==corrida, Esporte_4==basquete);
(Esporte_4==corrida, Esporte_5==basquete)),

%%% 16) O homem que está bebendo a cerveja Inglesa está exatamente à esquerda de quem está bebendo a cerveja Holandesa.

(
(Cerveja_1==inglesa, Cerveja_2==holandesa);
(Cerveja_2==inglesa, Cerveja_3==holandesa);
(Cerveja_3==inglesa, Cerveja_4==holandesa);
(Cerveja_4==inglesa, Cerveja_5==holandesa)),

%%% 09) O homem de 28 anos está exatamente à direita do homem de camiseta Branca.

(
(Idade_5==a28, Camiseta_4==branca);
(Idade_4==a28, Camiseta_3==branca);
(Idade_3==a28, Camiseta_2==branca);
(Idade_2==a28, Camiseta_1==branca)),

%%% 04) O amigo que gosta de Futebol está exatamente à direita do amigo que está bebendo a cerveja Irlandesa.

(
(Esporte_5==futebol, Cerveja_4==irlandesa);
(Esporte_4==futebol, Cerveja_3==irlandesa);
(Esporte_3==futebol, Cerveja_2==irlandesa);
(Esporte_2==futebol, Cerveja_1==irlandesa)),

%%% 17) Paulo está em algum lugar à direita do amigo de camiseta Azul.

(
(Nome_5==paulo, (Camiseta_4==azul; Camiseta_3==azul; Camiseta_2==azul; Camiseta_1==azul));
(Nome_4==paulo, (Camiseta_3==azul; Camiseta_2==azul; Camiseta_1==azul));
(Nome_3==paulo, (Camiseta_2==azul; Camiseta_1==azul));
(Nome_2==paulo, Camiseta_1==azul)),

%%% 01) Quem está bebendo a cerveja Alemã está em algum lugar entre Evaristo e quem está bebendo a cerveja Inglesa, nessa ordem.
(
(Nome_1==evaristo,(Cerveja_2==alema; Cerveja_3==alema; Cerveja_4==alema),Cerveja_5==inglesa);
(Nome_1==evaristo,(Cerveja_2==alema; Cerveja_3==alema),Cerveja_4==inglesa);
(Nome_1==evaristo,(Cerveja_2==alema),Cerveja_3==inglesa);
(Nome_2==evaristo,(Cerveja_3==alema; Cerveja_4==alema),Cerveja_5==inglesa);
(Nome_2==evaristo,(Cerveja_3==alema),Cerveja_4==inglesa);
(Nome_3==evaristo,(Cerveja_4==alema),Cerveja_5==inglesa)
),

%%% 06)Quem gosta de Basquete está em algum lugar entre quem gosta de Futebol e quem gosta de Surfe, nessa ordem.
(
(Esporte_1==futebol,(Esporte_2==basquete; Esporte_3==basquete; Esporte_4==basquete),Esporte_5==surfe);
(Esporte_1==futebol,(Esporte_2==basquete; Esporte_3==basquete),Esporte_4==surfe);
(Esporte_1==futebol,(Esporte_2==basquete),Esporte_3==surfe);
(Esporte_2==futebol,(Esporte_3==basquete; Esporte_4==basquete),Esporte_5==surfe);
(Esporte_2==futebol,(Esporte_3==basquete),Esporte_4==surfe);
(Esporte_3==futebol,(Esporte_4==basquete),Esporte_5==surfe)
),

%%% 15) O homem de Amarelo está em algum lugar entre quem pediu um hambúrguer Sem alface e quem está de Vermelho, nessa ordem.

(
(Hamburguer_1==semalface,(Camiseta_2==amarela; Camiseta_3==amarela; Camiseta_4==amarela),Cerveja_5==vermelha);
(Hamburguer_1==semalface,(Camiseta_2==amarela; Camiseta_3==amarela),Camiseta_4==vermelha);
(Hamburguer_1==semalface,(Camiseta_2==amarela),Camiseta_3==vermelha);
(Hamburguer_2==semalface,(Camiseta_3==amarela; Camiseta_4==amarela),Camiseta_5==vermelha);
(Hamburguer_2==semalface,(Camiseta_3==amarela),Camiseta_4==vermelha);
(Hamburguer_3==semalface,(Camiseta_4==amarela),Camiseta_5==vermelha)
),

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
