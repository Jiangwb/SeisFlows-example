%% plot model
close; clc; close all;
%% read data
ndat=16536900;  % how many data points in the binary file
fid=fopen('./proc000000_x.bin','rb');
x=fread(fid,ndat,'float');
fclose(fid);
disp('read proc000000_x.bin end');

fid=fopen('./proc000000_z.bin','rb');
z=fread(fid,ndat,'float');
fclose(fid);
disp('read proc000000_z.bin end');

fid=fopen('./proc000000_vp.bin','rb');
vp=fread(fid,ndat,'float');
fclose(fid);
disp('read proc000000_vp.bin end');
%% plot model
figure(1);
for i=2:100:ndat
    scatter(x(i),z(i),10,vp(i),'filled');hold on;
    if mod(i,10001)==0
        disp('plotting rate in %');
        disp(i/ndat*100);
    end
end
colorbar;colormap(jet);
