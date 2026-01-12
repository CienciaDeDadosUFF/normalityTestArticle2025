## 
R version 4.3.2 (2023-10-31 ucrt)
RStudio version 2023.12.0.369
Package nortest version 1.0.4
##

## Jelito-Pitera.R
Implementação dos testes de normalidade Jelito-Pitera bilateral (Test.N) e unilateral (Test.N.Uni). 
  - Entrada das funções: vetor contendo a amostra. 
  - Saída das funções: p-valor do teste.

## est-poder.R
Implementação para a estimação via Monte Carlo do poder dos testes: Anderson-Darling (AD), Jarque-Bera Robusto (JBR), Jelito-Pitera Bilateral (JP), Jelito-Pitera Unilateral (JP-Uni), Lilliefors (Li), Shapiro-Francia (SF) e Shapiro-Wilk(SW).
  - Entrada da função: matriz (r x n) contendo r amostras de tamanho n. 
  - Saída da função: vetor com o poder estimado para cada testes listado. 
  
