function [defl,teta,fi,umax,tmax,fimax]=bending(Ks,Qs,K,Q,nnode,node_z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate deformed beam bending and torsion shape and plot results
% File name: bending.m
%
% Ks		Structural stiffness matrix
% Qs		Structural load vector
% K		System stiffness matrix 
% Q		System load vector
% nnode         number of nodes
% node_z          nodal z-coordinates
%
% defl		deflection vector of size nnodes
% teta		rotation vector of size nnodes
% fi            twist vector of size nnodes
% umax          maximum deflection
% tetamax       maximum rotation
% fimax		maximum twist
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
W= zeros(nnode*3-3,1);
% Solve equation system
W= inv(Ks)* Qs;
Ws = zeros(nnode*3,1);
Ws(4:nnode*3,1)= W;
% Reaction loads are calculated
F_r = K*Ws - Q;
% Create result vector containing deflections, rotations and twist

% Separate deflections, rotations and twist in separate vectors
defl=zeros(nnode,1);
teta = zeros(nnode,1);
fi= zeros(nnode,1);

j=1;
for i=1:3:nnode*3-2
    defl(j,1)=Ws(i,1);
    j=j+1;
end

u=1;
for i=2:3:nnode*3-1
    teta(u,1)=Ws(u,1);
    u=u+1;
end

v=1;
for i=3:3:nnode*3
    defl(v,1)=Ws(i,1);
    v=v+1;
end

umax= max(defl);
tmax= max(teta);
fimax=max(fi);

% Normalise deflections, rotations and twist and plot results
% defl= defl./umax;
% tetamax=teta./tetamax;
% fimax=fi./fimax;

% plot()
% Reaction forces printout

