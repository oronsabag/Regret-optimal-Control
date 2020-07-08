function Kinf = TF_inf(sys)

gmin = 0;
gmax = 20;
run  = 1;

    Fail = Inf_check_g(gmax,sys);
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
    Fail = Inf_check_g(g_mid,sys);
    if Fail==1 %(if didnt work)
        gmin = g_mid;
    else
        gmax = g_mid;
    end
end
disp(['gamma_inf = ',num2str(g_final)]);

Kinf = Controller_inf(g_final,sys);

