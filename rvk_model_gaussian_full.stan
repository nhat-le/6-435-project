data {
  int N;
  int y[N];
}


parameters {
  vector<lower=0, upper=1>[N] r;
  vector[N] v;
  real k;
}

model {
  // Likelihood
  v[2:N] ~ normal(v[1:(N-1)], exp(k));
  r[2:N] ~ normal(r[1:(N-1)], exp(v[2:N]));
  
  // Likelihood
  y ~ bernoulli(r);
}