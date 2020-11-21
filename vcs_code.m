clear all
clc
close all
%% construction of labeling secrets

e1=[1   1 41 71 71];
e2=[40 40 70 111 111];
e3=[1   72  1   1 72];
e4=[71 142 142 71 142];
f=zeros(111,142);
 for i=1:5
 img=imread('plain.bmp');
 hlabel = vision.ConnectedComponentLabeler;
 hlabel.LabelMatrixOutputPort = true;
 hlabel.LabelCountOutputPort = false;
 labeled = step(hlabel, img(e1(i):e2(i),e3(i):e4(i)));
      f(e1(i):e2(i),e3(i):e4(i))   = i*~(~labeled);
 end

a=f;


%%

T=[1 1 1 0;
   1 1 0 1;
   1 0 1 1;
   0 1 1 1];

R1=[ 1 1 1 0;
     1 1 1 0;
     1 0 1 1;
     1 1 0 1];
 
R2=[ 1 1 1 0;
     1 0 1 1;
     1 1 0 1;
     1 1 1 0];
 
R3=[ 1 1 1 0;
     1 1 0 1;
     1 1 1 0;
     1 0 1 1];
    
R4=[1 0 1 1;
    1 1 1 0;
    1 1 1 0;
    1 1 0 1];

R5=[ 1 1 0 1
     1 1 1 0;
     1 0 1 1;
     1 1 1 0];
 % pixel expansion
  pixel_expansion = size(T,2);
  no_col_basis = size(T,2);   % number of column - basis matrix /*in this case is 4*/
  % construction of subpixel
   row_subpixel = 2;
   col_subpixel = pixel_expansion/row_subpixel;
 
%% construction of shares--------------------------------------------
% ==================================================================

p = size(T,1);
e1 = zeros(row_subpixel,1);
e2=e1;
e3=e1;
e4=e1;
e5=e1;
for i=1:size(a,1)           % i ===> row of plain image
    for j=1:size(a,2)       % j ===> column of plain image
           %% coulmn permutation 
                  rnd_perm = randperm(no_col_basis);  % generate random vector for column permutation
                  T  = T(:,rnd_perm);
                  R1 = R1(:,rnd_perm);
                  R2 = R2(:,rnd_perm);
                  R3 = R3(:,rnd_perm);
                  R4 = R4(:,rnd_perm);
                  R5 = R5(:,rnd_perm);
        %% construction of share 1
        %------------------------ "im2col" provide the best structure for subpixels
        
        switch a(i,j)
            case 0
                    d1=kron(~a(i,j),im2col(T(1,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 1
                    d1=kron(a(i,j),im2col(R1(1,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 2
                    d1=kron(a(i,j)-1,im2col(R2(1,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 3
                    d1=kron(a(i,j)-2,im2col(R3(1,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 4
                    d1=kron(a(i,j)-3,im2col(R4(1,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 5
                    d1=kron(a(i,j)-4,im2col(R5(1,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
        end

        e1 = [e1 d1];
        %% construction of share 2
         switch a(i,j)
            case 0
                    d2=kron(~a(i,j),im2col(T(2,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 1
                    d2=kron(a(i,j),im2col(R1(2,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 2
                    d2=kron(a(i,j)-1,im2col(R2(2,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 3
                    d2=kron(a(i,j)-2,im2col(R3(2,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 4
                    d2=kron(a(i,j)-3,im2col(R4(2,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 5
                    d2=kron(a(i,j)-4,im2col(R5(2,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
        end
        
        
        e2 = [e2 d2];
        %% construction of share 3
        switch a(i,j)
            case 0
                    d3=kron(~a(i,j),im2col(T(3,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 1
                    d3=kron(a(i,j),im2col(R1(3,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 2
                    d3=kron(a(i,j)-1,im2col(R2(3,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 3
                    d3=kron(a(i,j)-2,im2col(R3(3,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 4
                    d3=kron(a(i,j)-3,im2col(R4(3,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 5
                    d3=kron(a(i,j)-4,im2col(R5(3,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
        end
        
        
        e3 = [e3 d3];
        %% construction of share 4
        switch a(i,j)
            case 0
                    d4=kron(~a(i,j),im2col(T(4,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 1
                    d4=kron(a(i,j),im2col(R1(4,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 2
                    d4=kron(a(i,j)-1,im2col(R2(4,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 3
                    d4=kron(a(i,j)-2,im2col(R3(4,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 4
                    d4=kron(a(i,j)-3,im2col(R4(4,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
            case 5
                    d4=kron(a(i,j)-4,im2col(R5(4,:),[1 1/row_subpixel*pixel_expansion],'distinct')');
        end
        
        
        e4 = [e4 d4];     
        
    end
end
%% eliminating the initial vector for producing the shares
share_1 = e1(:,2:end);
share_2 = e2(:,2:end);
share_3 = e3(:,2:end);
share_4 = e4(:,2:end);

%% reconstructed shares for exhibition
share1 = im2col(share_1,[1 col_subpixel*size(a,2)],'distinct')';
share2 = im2col(share_2,[1 col_subpixel*size(a,2)],'distinct')';
share3 = im2col(share_3,[1 col_subpixel*size(a,2)],'distinct')';
share4 = im2col(share_4,[1 col_subpixel*size(a,2)],'distinct')';
%% example of superimposing 2 share & 3 share
imshow(~or(share2,share4));
title('superimposing two share===> {2 & 4}')
figure;
imshow(~(share2|share4|share1))

