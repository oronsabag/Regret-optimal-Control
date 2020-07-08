function As = rand_stable(dim)

Temp = rand(dim);

M = max(svd(Temp));

As = Temp/(M + 0.02);