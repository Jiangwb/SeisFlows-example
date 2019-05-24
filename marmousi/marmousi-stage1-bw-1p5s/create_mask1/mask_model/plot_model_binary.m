%% plot model
close; clc; close all;
NGLLX=3;NGLLZ=3;
%% read data
fid=fopen('./proc000000_x.bin','rb');
ndat=fread(fid,1,'int')./4; % how many data points in the binary file
x=fread(fid,ndat,'float');
fclose(fid);
disp('read proc000000_x.bin end');

fid=fopen('./proc000000_z.bin','rb');
ndat=fread(fid,1,'int')./4; % how many data points in the binary file
z=fread(fid,ndat,'float');
fclose(fid);
disp('read proc000000_z.bin end');

fid=fopen('./proc000000_vp.bin','rb');
ndat=fread(fid,1,'int')./4; % how many data points in the binary file
vp=fread(fid,ndat,'float');
fclose(fid);
disp('read proc000000_vp.bin end');

fid=fopen('./proc000000_vs.bin','rb');
ndat=fread(fid,1,'int')./4; % how many data points in the binary file
vs=fread(fid,ndat,'float');
fclose(fid);
disp('read proc000000_vs.bin end');
%% interpolates from an unstructured coordinates (mesh) to a structured coordinates (grid)
lx=max(x)-min(x);lz=max(z)-min(z);nn=ndat;
nx=floor(sqrt(nn*lx/lz)./NGLLX);
nz=floor(sqrt(nn*lz/lx)./NGLLZ);
dx=lx/nx;
dz=lz/nz;
x_structured=linspace(min(x),max(x),nx);
z_structured=linspace(min(z),max(z),nz);
vp_structured=zeros(nz,nx);
vs_structured=zeros(nz,nx);

for ix=1:nx
    disp(ix);
    for iz=1:nz
% for ix=174:174
%     for iz=28:28
        dist=zeros(1,ndat);
        x_position=x_structured(ix);
        z_position=x_structured(iz);
        % find the closest point
        for idat=1:ndat
            dist(idat)=sqrt((x_position-x(idat)).^2+(z_position-z(idat)).^2);
            if dist(idat)<=sqrt(dx.^2+dz.^2)./NGLLX
                break;
            end
        end
        dist(idat+1:end)=1000000.0;
        [val,position]=min(dist);     
        if val>0.6*dx % the minimal distance larger than one grid size, suggesting the grid is in air layer
            vp_structured(iz,ix)=NaN;
            vs_structured(iz,ix)=NaN;

        else
            vp_structured(iz,ix)=vp(position);
            vs_structured(iz,ix)=vs(position);            
        end
    end
end
%% plot model
figure(1);
h=imagesc(vp_structured);hold on;
set(h,'alphadata',~isnan(vp_structured));
set(gca,'YDir','normal');
set(gcf,'color','white');
set(gcf,'unit','centimeters','position',[0 0 30 10]);
%set(gca,'Position',[.13 .17 .80 .74],'linewidth',20,'fontsize',15);
set(gca,'linewidth',1,'fontsize',20);
set(gca,'Xtick',[1 round(5000/dx) round(10000/dx) round(15000/dx) round(20000/dx)]);
set(gca,'XTickLabel',{'0','5000','10000','15000','20000'});
set(gca,'Ytick',[1 round(1500/dz) round(3000/dz) round(4500/dz)]);
set(gca,'YTickLabel',{'0','1500','3000','4500'});
set(gca,'Clim',[0 1]);
colorbar;colormap(jet);
ylabel(colorbar,'Mask weighting','fontsize',20);
xlabel('Distance (m)','fontsize',20);
ylabel('Depth (m)','fontsize',20);

figure(2);
h=imagesc(vs_structured);hold on;
set(h,'alphadata',~isnan(vp_structured));
set(gca,'YDir','normal');
set(gcf,'color','white');
set(gcf,'unit','centimeters','position',[0 0 30 10]);
%set(gca,'Position',[.13 .17 .80 .74],'linewidth',20,'fontsize',15);
set(gca,'linewidth',1,'fontsize',20);
set(gca,'Xtick',[1 round(5000/dx) round(10000/dx) round(15000/dx) round(20000/dx)]);
set(gca,'XTickLabel',{'0','5000','10000','15000','20000'});
set(gca,'Ytick',[1 round(1500/dz) round(3000/dz) round(4500/dz)]);
set(gca,'YTickLabel',{'0','1500','3000','4500'});
set(gca,'Clim',[0 1]);
colorbar;colormap(jet);
ylabel(colorbar,'Mask weighting','fontsize',20);
xlabel('Distance (m)','fontsize',20);
ylabel('Depth (m)','fontsize',20);
