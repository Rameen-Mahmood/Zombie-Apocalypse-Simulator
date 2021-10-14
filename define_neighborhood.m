% Defining the neighborhood 
function [n] = define_neighborhood(i,j,matrix)

    %Here i,j represents the rows and column value of the matrix
    n1=matrix(i,j); 
    n2=matrix(i,j-1); 
    n3=matrix(i,j+1); 
    n4=matrix(i-1,j);
    n5=matrix(i-1,j-1);
    n6=matrix(i-1,j+1);
    n7=matrix(i+1,j);
    n8=matrix(i+1,j+1);
    n9=matrix(i+1,j-1);
    
    n = [n1 n2 n3 n4 n5 n6 n7 n8 n9]
end
    