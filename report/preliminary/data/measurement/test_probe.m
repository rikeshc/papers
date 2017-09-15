C=9.5e-12;
L=12e-9;
R=45;

f=logspace(3,10,1000);
omega=2*pi*f;
H = 1./(i*omega*R*C-omega.^2*L*C+1);

gain=abs(H);
loglog(f,gain) 