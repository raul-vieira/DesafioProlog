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
* Fonte: https://rachacuca.com.br/logica/problemas/amigas-na-praia/
*/

%FATOS - O QUE TEM DE BASE DE DADOS?

%GRAVATAS
gravata(amarela).
gravata(branca).
gravata(verde).
gravata(verde).
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
investimento(5000).
investimento(10000).
investimento(15000).
investimento(20000).
investimento(25000).

%IDADE

idade(40).
idade(45).
idade(50).
idade(55).
idade(60).

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
    (Gravata_3, Nome_3 Setor_3, Investimento_3, Idade_3, Profissao_3),
    (Gravata_4, Nome_4, Setor_4, Investimento_4, Idade_4, Profissao_4),
    (Gravata_5, Nome_5, Setor_5, Investimento_5, Idade_5, Profissao_5)
       ]) :-

%ANALISANDO AS INSTRUÇÕES DO PROBLEMA





