E = 70000;
Ixx=234000;
Iyy=51205;
A=2*40*3+60;
SC=18.465+16;
I0=Ixx+Iyy+A*SC^2;
G=2.69E+4;
J=740;
Gamma=35446153;
L=500;

syms P
M = [P-(pi^(2)*E*Ixx/(2*L)^2)  -P*SC;  -P*SC  (I0/A)-(pi^(2)*E*Gamma/(2*L)^2)-G*J];
detM = det(M);
P = solve(detM,P);