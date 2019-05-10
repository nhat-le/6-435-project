data {
  int N;
  int y[N];
}


parameters {
  vector<lower=0, upper=1>[N] r;
  real v;
}

model {  
  // Likelihood
  r[2:N] ~ beta(r[1:(N-1)] * exp(-v), (1 - r[1:(N-1)]) * exp(-v));
  
  // Likelihood
  y ~ bernoulli(r);
}