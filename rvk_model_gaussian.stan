data {
  int N;
  int y[N];
}


parameters {
  vector<lower=0, upper=1>[N] r;
  real v;
}

model {
  //Prior
  //v ~ normal(-4.5, 0.1);
  
  // Likelihood
  r[2:N] ~ normal(r[1:(N-1)], exp(v));
  
  // Likelihood
  y ~ bernoulli(r);
}