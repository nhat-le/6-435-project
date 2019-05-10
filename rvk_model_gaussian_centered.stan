data {
  int N;
  int y[N];
}


parameters {
  vector[N] r_raw;
  real v;
}

transformed parameters {
  vector<lower=0, upper=1>[N] r;
  r[1] = r_raw[1];
  r[2:N] = r[1:(N-1)] + r_raw[2:N] * exp(v);
}

model {
  // Likelihood
  r_raw ~ normal(0.5, 0.1);
  
  // Likelihood
  y ~ bernoulli(r);
}

