% The outputs is W. Note that "dlyap(A,B,C)" solves AXB-X+C=0;

function W = Lyapunov_W(sys)

A_W = (sys.A-sys.B*sys.Klqr)';
B_W = sys.A;
C_W = sys.Q;

W = dlyap(A_W,B_W,C_W);  

