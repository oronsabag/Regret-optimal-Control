function As = rand_antistable(dim)

Temp = rand(dim);

M = min(svd(Temp));

As = Temp/(M - 0.02);