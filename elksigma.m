function [Kesigma]=elksigma(le,P,I0,A);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assemble element initial stress stiffness matrix
% File name: elksigma.m
% 
% le [m]	Element length
% P  [N]	"Tensile" buckling load
% Kesigma is returned - element initial stress matrix
%
% Make sure tlee initial stress matrix is symmetric!

Kesigma = P*[36/30*le -3*le/30*le 0 -36/30*le -3*le/30*le 0;
    -3*le/30*le 4*le^2/30*le 0 3*le/30*le -le^2/30*le 0;
    0 0 I0/A*le 0 0 -I0/A*le ;
    -36/30*le 3*le/30*le 0 36/30*le 3*le/30*le 0;
    -3*le/30*le -le^2/30*le 0 3*le/30*le 4*le^2/30*le 0;
    0 0 -I0/A*le 0 0 I0/A*le];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

