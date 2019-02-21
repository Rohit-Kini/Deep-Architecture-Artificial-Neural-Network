% Linearly Separable Data

n = 100;
mA = [1.0, 0.5]; sigmaA = 0.5;
mB = [-1.0, 0.0]; sigmaB = 0.5;

classA(1,:) = randn(1,n).*sigmaA + mA(1);
classA(2,:) = randn(1,n).*sigmaA + mA(2);
classB(1,:) = randn(1,n).*sigmaB + mB(1);
classB(2,:) = randn(1,n).*sigmaB + mB(2);

x = [classA, classB];