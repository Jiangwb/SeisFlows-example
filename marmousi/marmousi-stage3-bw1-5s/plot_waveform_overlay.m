clc;clear;close all;
%% Plot forward modelling result with different density model
nt=5556;ntrace=500;dt=9e-4;
[obs_Ux] = ReadSuFast('./output/traces/obs/000000/Ux_file_single.su');
[obs_Uz] = ReadSuFast('./output/traces/obs/000000/Uz_file_single.su');
[syn_Ux_iter_01] = ReadSuFast('./output/traces_0001/syn/000000/Ux_file_single.su');
[syn_Uz_iter_01] = ReadSuFast('./output/traces_0001/syn/000000/Uz_file_single.su');
[syn_Ux_iter_50] = ReadSuFast('./output/traces_0083/syn/000000/Ux_file_single.su');
[syn_Uz_iter_50] = ReadSuFast('./output/traces_0083/syn/000000/Uz_file_single.su');
%% initial waveform overlay
% Uz
figure(2);
wiggle(obs_Uz(1:40:end,1:4:end),'2kK');hold on;
wiggle(syn_Uz_iter_01(1:40:end,1:4:end),'2rR');hold on;
%axis ij;
set(gca,'Xtick',[1 1*round(500/4/9) 2*round(500/4/9) 3*round(500/4/9) 4*round(500/4/9) 5*round(500/4/9)]);
set(gca,'XTickLabel',{'0','1','2','3','4','5'});
set(gca,'Ytick',[1 1*round(nt/5/40) 2*round(nt/5/40) 3*round(nt/5/40) 4*round(nt/5/40) 5*round(nt/5/40)-1]);
set(gca,'YTickLabel',{'0','1','2','3','4','5'});
set(gca,'FontName','times','FontSize',26);
set(gcf,'unit','centimeters','position',[3 1 60 24]);set(gca,'Position',[.06 .15 .9 .8]);
ylabel('Time (s)','FontName','times','FontSize',26);
xlabel('Offset (km)','FontName','times','FontSize',26);hold off;
%% final waveform overlay
% Uz
figure(4);
wiggle(obs_Uz(1:40:end,1:4:end),'2kK');hold on;
wiggle(syn_Uz_iter_50(1:40:end,1:4:end),'2rR');hold on;
%axis ij;
set(gca,'Xtick',[1 1*round(500/4/9) 2*round(500/4/9) 3*round(500/4/9) 4*round(500/4/9) 5*round(500/4/9)-1]);
set(gca,'XTickLabel',{'0','1','2','3','4','5'});
set(gca,'Ytick',[1 1*round(nt/5/40) 2*round(nt/5/40) 3*round(nt/5/40) 4*round(nt/5/40) 5*round(nt/5/40)-1]);
set(gca,'YTickLabel',{'0','1','2','3','4','5'});
set(gca,'FontName','times','FontSize',26);
set(gcf,'unit','centimeters','position',[3 1 60 24]);set(gca,'Position',[.06 .15 .9 .8]);
ylabel('Time (s)','FontName','times','FontSize',26);
xlabel('Offset (km)','FontName','times','FontSize',26);hold off;