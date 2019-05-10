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
  // Priors
  r[1] ~ beta(2, 2);
  v[1] ~ normal(-4, 0.1);
  k ~ normal(-4, 0.1);


  // Likelihood
  v[2:N] ~ normal(v[1:(N-1)], exp(k));
  r[2:N] ~ beta(r[1:(N-1)] .* exp(-v[2:N]), (1 - r[1:(N-1)]) .* exp(-v[2:N]));
  
  // Likelihood
  y ~ bernoulli(r);
}