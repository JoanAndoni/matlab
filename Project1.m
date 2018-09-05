clear *; close all; clc;
arrP = [1 2 5 10 40 60 80 100];
arrT = [0 200];
R = 0.08205;
BO = 0.05587;
AO = 2.2789;
c = 128000;
b = -0.01587;
a = 0.01855;

for i = 1:8
    P = arrP(i);
    TK = arrT(1)+273.15;
    B = R*TK*BO -AO - R*c/TK.^2;
    Y = -R*TK*BO*b + AO*a - (R*c*BO)/TK.^2;
    S = (R*BO*b*c)/TK.^2;

    Vi = ((R*TK)/P);
    
    Error = 100;
    ETol = 0.000001;
    cont = 0;

    while (Error > ETol)
        cont = cont+1;
        FuncVi = ((R*TK)/Vi) + (B/Vi.^2) + (Y/Vi.^3) + (S/Vi.^4) - P;
        FuncDVi = -((2*B*Vi.^2 + 4*S + R*TK*Vi.^3 + 3*Vi*Y) / Vi.^5);
        Viplus = (Vi - (FuncVi/FuncDVi));
    
        Error = (abs(1-(Vi/Viplus))*100);
        
        disp(['Iter: ' num2str(cont)]);
        disp(['P: ' num2str(P) ' atm']);
        disp(['T: ' num2str(TK) ' K' ]);
        disp(['Vi: ' num2str(Vi) ' L']);
        disp(['f(Xi): ' num2str(FuncVi)]);
        disp(['f´(Xi): ' num2str(FuncDVi)]);
        disp(['Vi+1: ' num2str(Viplus) ' L ']);
        disp(['Error: ' num2str(Error) ' %']); 
        disp(' ');
        Vi = Viplus;
    end
disp(' ');
disp(['Pressure = '  num2str(P) ' atm' ]);
disp(['Temp = '  num2str(TK) ' K']);
disp(['Volume: ' num2str(Vi) ' L']);
Z=(P*Vi)/(R*TK);
arrZA(i)= Z;
disp(['Comp fact Z: ' num2str(Z) ' K']);
disp(' ');
end

for i = 1:8

    P = arrP(i);
    TK = arrT(2)+273.15;
    B = R*TK*BO -AO - R*c/TK.^2;
    Y = -R*TK*BO*b + AO*a - (R*c*BO)/TK.^2;
    S = (R*BO*b*c)/TK.^2;

    Vi = ((R*TK)/P);
    
    Error = 100;
    ETol = 0.000001;
    cont = 0;

    while (Error > ETol)
        cont = cont+1;
        FuncVi = ((R*TK)/Vi) + (B/Vi.^2) + (Y/Vi.^3) + (S/Vi.^4) - P;
        FuncDVi = -((2*B*Vi.^2 + 4*S + R*TK*Vi.^3 + 3*Vi*Y) / Vi.^5);
        Viplus = (Vi - (FuncVi/FuncDVi));
    
        Error = (abs(1-(Vi/Viplus))*100);
        
        disp(['Iter: ' num2str(cont)]);
        disp(['P: ' num2str(P) ' atm']);
        disp(['T: ' num2str(TK) ' K' ]);
        disp(['Vi: ' num2str(Vi) ' L']);
        disp(['f(Xi): ' num2str(FuncVi)]);
        disp(['f´(Xi): ' num2str(FuncDVi)]);
        disp(['Vi+1: ' num2str(Viplus) ' L ']);
        disp(['Error: ' num2str(Error) ' %']); 
        disp(' ');
        Vi = Viplus;
    end
disp(' ');
disp(['Pressure = '  num2str(P) ' atm' ]);
disp(['Temp = '  num2str(TK) ' K']);
disp(['Volume: ' num2str(Vi) ' L']);
Z=(P*Vi)/(R*TK);
arrZB(i)= Z;    
disp(['Comp fact Z: ' num2str(Z) ' K']);
disp(' ');
end

plot(arrP,arrZA, 'r*-', arrP,arrZB, 'b^-'), hold on;
title('Compressibility factor vs pressure');
xlabel('Pressure atm', 'Color','g');
ylabel('Compressibility factor', 'Color', 'g');
legend('Temperature = 0°','Temperature = 200°')