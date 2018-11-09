function [pb,ub]=buckle(Ks,Ksigmas,nnode,node_z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solve beam buckling equation
% File name: buckle.m
% 
% Ks        Structural stiffness matrix
% Ksigmas	Structural inital stiffness matrix
% nnode     number of nodes
% node_z    nodal x-coordinates
%
% pb		Buckling load vector, in numerical order
% ub		matrix of eigenvalue dofs
% 		(row i of ub is buckling mode of buckling load i)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate eigenvalues and eigenvectors
[pb,ub]=eig(Ks,-Ksigmas);
% Create result vector containing deflections, rotations and twist
W_buckle= zeros(nnode,nnode-1);
W_buckle(2:nnode,1:nnode*3-3) = pb(1:3:nnode*3-3,1:nnode*3-3)

teta_buckle= zeros(nnode,nnode-1);
teta_buckle(2:nnode,1:nnode*3-3) =pb(2:3:nnode*3-3,1:nnode*3-3);

fi_buckle= zeros(nnode,nnode-1);
fi_buckle(2:nnode,1:nnode*3-3) = pb(3:3:nnode*3-3,1:nnode*3-3);

% separate deflections, rotations and twist in separate vectors

% Normalise deflections, rotations and twist for plotting purposes
% only if columns contain elements <> 0

        
    

% Plot buckling modes
figure(4)
plot(W_buckle(:,1)./max(abs(W_buckle(:,1))));
hold on;
plot(W_buckle(:,2)./max(abs(W_buckle(:,2))));
hold on;
plot(abs(W_buckle(:,3))./max(abs(W_buckle(:,3))));
hold on;
title('First three buclking modes of defl')

figure(5)

plot(teta_buckle(:,1)./max(abs(teta_buckle(:,1))));
hold on;
plot(teta_buckle(:,2)./max(abs(teta_buckle(:,2))));
hold on;
plot(abs(teta_buckle(:,3))./max(abs(teta_buckle(:,3))));
hold on;
title('First three buclking modes of teta')

figure(6)
plot(fi_buckle(:,1)./max(abs(fi_buckle(:,1))));
hold on;
plot(fi_buckle(:,2)./max(abs(fi_buckle(:,2))));
hold on;
plot(abs(fi_buckle(:,3))./max(abs(fi_buckle(:,3))));
hold on;
title('First three buclking modes of fi')





