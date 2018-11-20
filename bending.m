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
Ws= zeros(nnode*3-3,1);
% Solve equation system
Ws= inv(Ks)* Qs;
W = zeros(nnode*3,1);
W(4:nnode*3,1)= Ws;
% Reaction loads are calculated
F_r = K*W - Q;
% Create result vector containing deflections, rotations and twist

% Separate deflections, rotations and twist in separate vectors
defl=zeros(nnode,1);
teta = zeros(nnode,1);
fi= zeros(nnode,1);

j=1;
for i=1:3:nnode*3-2
    defl(j,1)=W(i,1);
    j=j+1;
end

u=1;
for i=2:3:nnode*3-1
    teta(u,1)=W(i,1);
    u=u+1;
end

v=1;
for i=3:3:nnode*3
    fi(v,1)=W(i,1);
    v=v+1;
end

umax= max(abs(defl));
tmax= max(abs(teta));
fimax=max(abs(fi));

% Normalise deflections, rotations and twist and plot results
defl= defl./umax;
teta=teta./tmax;
fi=fi./fimax;

figure(1)
suptitle('Bending')
subplot(3,1,1)
plot(node_z,defl,'r-o');
grid on;
title('Bending Deflection')
xlabel('Node Coordinates');
ylabel('Displacement: w')
hold on;

subplot(3,1,2)
plot(node_z,teta,'b-o');
grid on;
title('Bending Angle')
xlabel('Node Coordinates');
ylabel('Displacement :\theta')
hold on;

subplot(3,1,3)
plot(node_z,fi,'g-o');
grid on;
title('Bending Torsion Angle')
xlabel('Node Coordinates');
ylabel('Displacement: \phi')
hold on;
% Reaction forces printout

