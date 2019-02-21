%  net=network(1,3,[1;1;0],[1;0;0],[0 0 0; 1 0 0; 0 1 0],[0 0 1]);
%  
%  net.layers{1}.size = 8;
%  net.layers{2}.size = 4;
%  net.layers{3}.size = 2;
%  view(net)
 
 net=network(1,2,[1;1],[1;0],[0 0; 1 0],[0 1]);
 net.layers{1}.size = 6;
 net.layers{2}.size = 3;
 view(net)