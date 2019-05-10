data {
  int N;
}

generated quantities {
  // Simulate k from prior model
  real k = normal_rng(-4, 1);
  
  
  // Simulate v, r and y
  real r[N];
  real v[N];
  int y[N];
  
  v[1] = normal_rng(-4, 0.1);
  r[1] = beta_rng(2, 2);
  y[1] = bernoulli_rng(r[1]);
  //print(r[1]);
  
  for (n in 2:N) {
    v[n] = normal_rng(v[n - 1], exp(k));
	r[n] = beta_rng(r[n - 1] * exp(-v[n]), (1 - r[n - 1]) * exp(-v[n]));
    y[n] = bernoulli_rng(r[n]);
	print(y[n]);
	//print(r[n]);
  }  
}
