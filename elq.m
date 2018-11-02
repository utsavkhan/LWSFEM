function [Qe]=elq(le,q,qt);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assemble element load vector
% File name: elq.m
% 
% le [m]	Element length
% q  [N/m]	Element pressure load (constant in this version)
% Qe is returned - element load vector
%
Qe = [q*le/2;
    -q*le^2/12;
    qt*le/2;
    q*le/2;
    q*le^2/12;
    qt*le/2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


