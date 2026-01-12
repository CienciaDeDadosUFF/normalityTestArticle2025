#########################################################################
######## Função para estimar o poder de testes de normalidade ###########
#########################################################################
## Entradas: amostra (matriz r (replicações) x n (tamanho da amostra)) ##
##           alpha (nível de significância)                            ##
## Saída: vetor com poder estimados para cada teste de normalidade     ##  
## Teste de Normalidade: Anderson-Darling (AD)                          ##
##                       Jarque-Bera Robusto (JBR)                     ##
##                       Jelito-Pitera Bilateral (JP)                  ##
##                       Jelito-Pitera Unilateral (JP-Uni)             ##
##                       Lilliefors (Li)                               ##
##                       Shapiro-Francia (SF)                          ##
##                       Shapiro-Wilk (SW)                             ##
#########################################################################

est_poder = function(amostra, alpha){
  # implementação dos testes de Jelito-Pitera
  source("Jelito-Pitera.R")
  pvalor = matrix(ncol = 7, nrow = nrow(amostra))
  colnames(pvalor) = c("AD", "JBR", "JP", "JP-Uni", "Li", "SF","SW")
  poder = vector(length = 7)
  for(i in 1:nrow(amostra)){
    pvalor[i,1] = nortest::ad.test(amostra[i,])$p.value
    pvalor[i,2] = lawstat::rjb.test(amostra[i,])$p.value
    pvalor[i,3] = Test.N(amostra[i,])
    pvalor[i,4] = Test.N.Uni(amostra[i,])
    pvalor[i,5] = nortest::lillie.test(amostra[i,])$p.value
    pvalor[i,6] = nortest::sf.test(amostra[i,])$p.value
    pvalor[i,7] = shapiro.test(amostra[i,])$p.value  
  }
  for(j in 1:7){
    poder[j] = sum(ifelse(pvalor[,j]<=alpha,1,0))/nrow(amostra)*100
  }
  names(poder) = c("AD", "JBR", "JP", "JP-Uni", "Li", "SF","SW")
  return(poder)
}
