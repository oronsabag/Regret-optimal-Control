function Knehari = find_Knehari(T)

%%Generate PI
A_PI = T.F;
B_PI = (T.F)';
C_PI = (T.G)*(T.G)';
LyaK.PI = dlyap(A_PI,B_PI,C_PI);

gmin = 0;
gmax = 30;
run  = 1;

Fail = nehari_check_g(gmax,T,LyaK);

if Fail ==1
    disp('g_max is too small');
return
end

while run
    if gmax-gmin>0.0001
        g_mid = (gmin+gmax)/2;
    else
        g_final = gmax;
        break;
    end
    Fail = nehari_check_g(g_mid,T,LyaK);
    if Fail==1 %(if didnt work)
        gmin = g_mid;
    else
        gmax = g_mid;
    end
end
disp(['gamma_regret = ',num2str(g_final)]);

Knehari = Controller_nehari(g_final + 0.0001,T,LyaK);

