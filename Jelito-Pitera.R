####################################################################
### Funções para calcular o p-valor dos testes de Jelito-Piteral ###
### Test.N - caso bilateral                                      ###
### Test.N.Uni - caso unilateral                                 ###
####################################################################
### Entrada: vetor contendo a amostra                            ###
### Saída: p-valor do teste                                      ###
####################################################################

Test.N= function(x){
  n <- length(x)
  q1<- quantile(x,0.2)
  q2<- quantile(x,0.8)
  low <-x[x<=q1]
  med <-x[x>q1&x<q2]
  high<-x[x>=q2]
  N<-var(low)+var(high)-2*var(med)
  N<-N* sqrt(n)/(var(x)*1.8)
  pvalue = 2*(1-pnorm(abs(N)))
  return(pvalue)
}

Test.N.Uni= function(x){
  n <- length(x)
  q1<- quantile(x,0.2)
  q2<- quantile(x,0.8)
  low <-x[x<=q1]
  med <-x[x>q1&x<q2]
  high<-x[x>=q2]
  N<-var(low)+var(high)-2*var(med)
  N<-N* sqrt(n)/(var(x)*1.8)
  if(N<0){
   pvalue = pnorm(N)  
  }else{
   pvalue = 1-pnorm(N)
  }
  return(pvalue)
}
