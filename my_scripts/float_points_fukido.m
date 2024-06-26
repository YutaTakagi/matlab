%
% === ver 2015/10/26   Copyright (c) 2015 Takashi NAKAMURA  =====
%                for MATLAB R2015a,b  
clear all

grd='D:/ROMS/Data/Fukido/fukido_grd_v7.nc';
% grd='D:/ROMS/Yaeyama/Data/Yaeyama3_grd_v8.nc';

h          = ncread(grd,'h');
lat_rho    = ncread(grd,'lat_rho');
lon_rho    = ncread(grd,'lon_rho');
x_rho      = ncread(grd,'x_rho');
y_rho      = ncread(grd,'y_rho');
[Im,Jm] = size(h);
x_corner_m = min(min(x_rho));
y_corner_m = min(min(y_rho));
%c(1:Im,1:Jm)=0;

k=0;
i=1;
resol = 1;  % 1/3/5/...

close all

shallow_area =  ones(size(h));
shallow_area(h<-9) = 0;
shallow_area(h>0.5)= 0;

shallow_area(1:Im,1)=0;
shallow_area(1:Im,Jm)=0;
shallow_area(1,1:Jm)=0;
shallow_area(Im,1:Jm)=0;

%imshow(shallow_area)
%axis on
%colorbar
[ix,iy]=find(shallow_area == 1);

%% 
% for i=1:size(ix)
%     latfloat_ini(i)=lat_rho(ix(i),iy(i));
%     lonfloat_ini(i)=lon_rho(ix(i),iy(i));
%     dfloat_ini(i)=h(ix(i),iy(i)).*-1;
% end
N_float = 0;

for i=1:size(ix)
%     y_c = y_rho(ix(i),iy(i));
%     x_c = x_rho(ix(i),iy(i));
%     d_y = ( y_rho(ix(i),iy(i)+1) - y_rho(ix(i),iy(i)-1) )/2/resol;
%     d_x = ( x_rho(ix(i)+1,iy(i)) - x_rho(ix(i)-1,iy(i)) )/2/resol;
%     
%     y_s = y_c - d_y*floor(resol/2);
%     x_s = x_c - d_x*floor(resol/2);
    
    y_c = iy(i);
    x_c = ix(i);
    d_y = 1/2/resol;
    d_x = 1/2/resol;
    
    y_s = y_c - d_y*floor(resol/2);
    x_s = x_c - d_x*floor(resol/2);
    
    for j=1:resol
        for k=1:resol
            N_float = N_float+1;
            yfloat_ini(N_float)=y_s + d_y*(j-1);
            xfloat_ini(N_float)=x_s + d_x*(k-1);
 %           dfloat_ini(N_float)=h(ix(i),iy(i)).*-1;
            dfloat_ini(N_float)=-1;
        end
    end    
end

%% 

dfloat_ini2 = dfloat_ini.*-1;

date_str = 'initial points';

xsize=Im*2+100; ysize=Jm*2+100;  % for YAEYAM1
%xsize=290; ysize=680; % for SHIRAHO
%xsize=500; ysize=650; % for SHIRAHO zoom
xmin=0;   xmax=max(max(x_rho));  ymin=0;   ymax=max(max(y_rho));

% [h_scatter,h_contour,h_annot]=createfltplot2(x_rho,y_rho,xfloat_ini(:),yfloat_ini(:),dfloat_ini2(:),h,date_str,'Larvae',-1,30,flipud(jet(128)),xsize,ysize,xmin,xmax,ymin,ymax);
%[h_scatter,h_contour,h_annot]=createfltplot2(x_rho,y_rho,xfloat_ini(:),yfloat_ini(:),dfloat_ini2(:),h,date_str,'Larvae',-1,30,flipud(jet(128)),xsize,ysize,xmin,xmax,ymin,ymax);
% [h_scatter,h_contour,h_annot]=createfltplot2(x_rho,y_rho,xfloat(:,i),yfloat(:,i),dfloat(:,i),h,date_str,'Larvae',-1,40,flipud(winter(256)),xsize,ysize,xmin,xmax,ymin,ymax);
%%
% ! Initial floats locations for all grids:
% !
% !   G      Nested grid number
% !   C      Initial horizontal coordinate type (0: grid units, 1: spherical)
% !   T      Float trajectory type (1: Lagrangian, 2: isobaric, 3: Geopotential)
% !   N      Number floats to be released at (Fx0,Fy0,Fz0)
% !   Ft0    Float release time (days) after model initialization
% !   Fx0    Initial float X-location (grid units or longitude)
% !   Fy0    Initial float Y-location (grid units or latitude)
% !   Fz0    Initial float Z-location (grid units or depth)
% !   Fdt    Float cluster release time interval (days)
% !   Fdx    Float cluster X-distribution parameter
% !   Fdy    Float cluster Y-distribution parameter
% !   Fdz    Float cluster Z-distribution parameter

G=1; C=0; T=1; N=1; 
%Ft0=1+(17-9)/24;  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ft0=4900+4+(17-9)/24-101/24/60/60;  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  4900 = 2013-06-01 - 2000-01-01 (days)
Ft0=1-10/24/60/60;  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  4900 = 2013-06-01 - 2000-01-01 (days)
Fz0=0;
Fdt=0.0; Fdx=0.0; Fdy=0.0; Fdz=0.0; 

fid=fopen('roms_flt.txt','w');   
for i=1:N_float
%     fprintf(fid,'%i %i %i %i %f %f %f %f %f %f %f %f\r\n',G,C,T,N,Ft0,xfloat_ini(i),yfloat_ini(i),dfloat_ini(i),Fdt,Fdx,Fdy,Fdz);   
    fprintf(fid,'%i %i %i %i %f %f %f %f %f %f %f %f\r\n',G,C,T,N,Ft0,xfloat_ini(i),yfloat_ini(i),Fz0,Fdt,Fdx,Fdy,Fdz);   
end
fclose(fid) ;

totalfloats =  N_float*N

fid=fopen('LTRANS_flt.txt','w');   
for i=1:N_float
    fprintf(fid,'%f, %f, %f\r\n',xfloat_ini(i),yfloat_ini(i),dfloat_ini(i));   
end
fclose(fid) ;

totalfloats =  N_float*N
