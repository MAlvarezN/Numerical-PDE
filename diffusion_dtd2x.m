% -----------------------------------------------
%{
    Transient Diffusion
    -------------------
Consider the partial differential equation:
k du/dt = d2u/dx2

See section 3.3
 Sadiku, M. N. (2018).
 Computational Electromagnetics with MATLAB.
 CRC Press.
https://www.taylorfrancis.com/books/9781315151250
%}
% -----------------------------------------------

close all
clear
clc

% -----------------
% By sttability r <= .5 ,then r = dt / ( k * dx^2 ) <=.5
r  = .5 ;
k  = .5 ;
dx = .1
dt = r * ( k * dx^2 )

ndx = 10 ; % Total spatial steps = length / dx
ndt = 20 ;  % Total time steps = Total time / dt

% -----------------
% rows are spatial index
% columns are time index
u = zeros( ndx , ndt ) ;

% Boundary conditions: u(a,t) and u(b,t) 
u( 1   , : ) = .5 ;
u( ndx , : ) = -.5 ;
% Initial condition: u(x,0)
u( :   , 1 ) = 1 ;

% -----------------
% Simple loop to update u in each time
for i = 2 : ndx - 1
    for j = 1 : ndt - 1
        
u( i, j + 1 ) =             r * u( i + 1 , j ) + ...
                ( 1 - 2 * r ) * u( i     , j )     + ...
                            r * u( i - 1 , j ) ;
    end    
end
                        
% -----------------------------------------------
figure,
  subplot(1,2,1)
    imagesc(u.')
    axis xy
    xlabel('Spatial steps')
    ylabel('Time steps')
    title('Intensity of u(x,t)')
  subplot(1,2,2)
    mesh(u.')
    axis xy
    view(50,30)
    xlabel('Spatial steps')
    ylabel('Time steps')
    title('Mesh of u(x,t)')
% -----------------------------------------------    