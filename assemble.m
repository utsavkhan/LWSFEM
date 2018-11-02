function [K,Q,M,Ksigma]=assemble(le,EI,GJ,I0,A,J0,q,qt,S,T,m,P,ndof,nelem);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assemble system stiffness matrix, load vector, mass matrix (not necessary)
% and initial stress matrix
% File name: assemble.m
%
% K		System stiffness matrix
% Q		System load vector
% M		System mass matrix
% Ksigma        System initial stress matrix
%
% le		element length [m]
% EI		element bending stiffness [Nm2]
% GJ		element torsional stiffness [Nm2]
% I0		element polar moment of inertia [m4]
% A		element cross-section area [m2]
% J0		element mass moment of inertia [kgm]
% q             element transverse pressure load [N/m]
% qt            element torsion pressure load [Nm/m]
% S             transverse point load [N]
% T             local torque [Nm]
% m		element mass per unit length [kg/m]
% P		applied buckling load [N], positive if tensile
% ndof		number of degrees of freedom
% nelem		number of elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

K=zeros(ndof);
Q=zeros(ndof,1);
M=zeros(ndof);
Ksigma=zeros(ndof);
%% Appending Ke
[Ke]=elk(le,EI,GJ);


for i = 1:6
        for j = 1:6
            K(i,j) = K(i,j)+Ke(i,j);
        end
end

for i = 1:60
        for j = 1:60
            K(i+3,j+3) = K(i+3,j+3)+ K(i,j);
        end
end
%% Appending Ksigma
[Kesigma]=elksigma(le,P,I0,A);

for i = 1:6
        for j = 1:6
            Ksigma(i,j) = Ksigma(i,j)+Kesigma(i,j);
        end
end

for i = 1:60
        for j = 1:60
            Ksigma(i+3,j+3) = Ksigma(i+3,j+3)+ Ksigma(i,j);
        end
end
%% Appending Q
[Qe]=elq(le,q,qt);

for i = 1:6            
    Q(i) = Q(i)+Qe(i);
end

for i = 1:60
    Q(i+3) = Q(i+3)+ Q(i);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add concentrated loads
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

