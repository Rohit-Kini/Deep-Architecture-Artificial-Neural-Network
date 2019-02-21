% Linearly Non-Separable Data

n = 100;
mA = [1.0, 0.3]; sigmaA = 0.2;
mB = [0.0, -0.1]; sigmaB = 0.3;

classA(1,:) = [randn(1,round(0.5*n)).*sigmaA-mA(1), randn(1,round(0.5*n)).*sigmaA+mA(1)];
classA(2,:) = randn(1,n).*sigmaA + mA(2);
classB(1,:) = randn(1,n).*sigmaB + mB(1);
classB(2,:) = randn(1,n).*sigmaB + mB(2);

x = [classA, classB];