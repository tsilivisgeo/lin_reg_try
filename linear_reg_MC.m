% linear regression try
%  MC Simulation and simple linear regression

%=============================================================================
% For example: y = B + A * x

% We will predict y given the input x and the goal of the linear 
% regression learning algorithm is to find the values for 
% the coefficients A and B. (weightings)

% Different techniques can be used to learn the linear regression model
% from data, such as a linear algebra solution for ordinary least squares and
% gradient descent optimization.
%=============================================================================

clear all;
close all;

%initial parameters
%=========================================================
n = 1000; % size of dimensions of the square matrices A,B
iterations = 1000; % number of iterations
A = rand(n)*10; % A belongs [0,10] uniformly 
B = rand(n)*10; % B belongs [0,10] uniformly 
%rand(2)=rand(2,2)
%rand(2,1)=sthlh me dyo grammes
%mporw na xrhsimopoiw kai th unifrnd 
%=========================================================

x= load("autodata.txt"); %prosexe to path, allaze to apo to panw aristera tab
size(x); 

num_of_ios = 15;
%Anow=zeros(1,num_of_ios);
%Bnow=zeros(num_of_ios,1);
%for l=1:num_of_ios
%Anow = Anow+A(1,l);
%Bnow = Bnow+B(l,1); %ta a,b tha ta vgalw oxi san kathara noumera 
                        % alla san synola (dokimh)
%end                       

Anow=rand *10;
Bnow=rand* 10;
y = Anow *x + Bnow ;
y1= y(1:num_of_ios,1) ; %h rand vgazei 2x2 pinaka ara to ekmetalleuomai 
%y2= y(1:num_of_ios,2) ; % kai ftiaxnw 2 eutheies gia sygkrish
%plot (x,y1)
%plot (x,y2)
%plot (x,y,'--k')
%hold on

yreal = load("autoresults.txt");
plot (x,yreal,'r')
hold on
grid on

bestfit = y(1:num_of_ios,1) ;
bestA = Anow;
bestB = Bnow;
divergence = abs(yreal-y1);

for i=1:iterations

    %Averynow=rand(1,num_of_ios)*10;
    %Bverynow=rand(num_of_ios,1)*10;
    Averynow=rand*10;
    Bverynow=rand*10;
    y = Averynow *x + Bverynow ;
    y1= y(1:num_of_ios,1) ;
    %y2= y(1:num_of_ios,2) ;
    divergence_new1 =abs(yreal-y1) ;
    %divergence_new2 =abs(yreal-y2) ;
       d1=0;
       %d2=0;
       
       for j=1:num_of_ios
           d1=d1+divergence_new1(j);
           %d2=d2+divergence_new2(j);
       end
    
    if d1 < divergence
       divergence=d1;
       bestA= Averynow;
       bestB= Bverynow;
       bestfit=y1 ;
    endif
    %if d2 < divergence
       %divergence=d2;
       %bestA= Averynow;
       %bestB= Bverynow;
       %bestfit=y2 ;
    %endif
       
end 

plot (x,bestfit,'+g')
disp ("the value of the fittest A is")
disp (bestA)
disp ("the value of the fittest B is")
disp (bestB)

%best fit function
% x= load("autodata.txt"); % neo dataset
         % edw tha exoume th synarthsh kai ta data kai tha psaxoume 
         % ta anamenomena apotelesmata
Unknown_y= bestA*x + bestB ;

% plot (x,unknown_y,'g')










