clc;clear;close all;
%% Plot forward modelling result with different density model
nt=3000;ntrace=500;dt=5e-4;
[obs_Ux] = ReadSuFast('./output/traces/obs/000000/Ux_file_single.su');
[obs_Uz] = ReadSuFast('./output/traces/obs/000000/Uz_file_single.su');
[syn_Ux_iter_01] = ReadSuFast('./output/traces_0001/syn/000000/Ux_file_single.su');
[syn_Uz_iter_01] = ReadSuFast('./output/traces_0001/syn/000000/Uz_file_single.su');
[syn_Ux_iter_50] = ReadSuFast('./output/traces_0005/syn/000000//Ux_file_single.su');
[syn_Uz_iter_50] = ReadSuFast('./output/traces_0005/syn/000000/Uz_file_single.su');
% read bandpass filtered waveform
[obs_Uz_filter] = ReadSegyFast('./output/obs/Uz_filter_1_2.segy');
[syn_Uz_iter_50_filter] = ReadSegyFast('./output/syn/Uz_filter_1_2.segy');
%% initial waveform overlay
% Uz
figure(1);
wiggle(obs_Uz(1:40:end,1:1:140),'2kK');hold on;
wiggle(syn_Uz_iter_01(1:40:end,1:1:140),'2rR');hold on;
%axis ij;
set(gca,'Xtick',[1 0.5*round(500/9) 1*round(500/9) 1.5*round(500/9) 2*round(500/9) 2.5*round(500/9)]);
set(gca,'XTickLabel',{'0','0.5','1','1.5','2','2.5'});
set(gca,'Ytick',[1 0.5*round(nt/1.5/40) 1*round(nt/1.5/40) 1.5*round(nt/1.5/40)]);
set(gca,'YTickLabel',{'0','0.5','1','1.5'});
set(gca,'FontName','times','FontSize',26);
set(gcf,'unit','centimeters','position',[3 1 60 24]);set(gca,'Position',[.06 .15 .9 .8]);
ylabel('Time (s)','FontName','times','FontSize',26);
xlabel('Offset (km)','FontName','times','FontSize',26);hold off;
%% final waveform overlay
% Uz
figure(2);
wiggle(obs_Uz(1:40:end,1:1:140),'2kK');hold on;
wiggle(syn_Uz_iter_50(1:40:end,1:1:140),'2rR');hold on;
%axis ij;
set(gca,'Xtick',[1 0.5*round(500/9) 1*round(500/9) 1.5*round(500/9) 2*round(500/9) 2.5*round(500/9)]);
set(gca,'XTickLabel',{'0','0.5','1','1.5','2','2.5'});
set(gca,'Ytick',[1 0.5*round(nt/1.5/40) 1*round(nt/1.5/40) 1.5*round(nt/1.5/40)]);
set(gca,'YTickLabel',{'0','0.5','1','1.5'});
set(gca,'FontName','times','FontSize',26);
set(gcf,'unit','centimeters','position',[3 1 60 24]);set(gca,'Position',[.06 .15 .9 .8]);
ylabel('Time (s)','FontName','times','FontSize',26);
xlabel('Offset (km)','FontName','times','FontSize',26);hold off;
%% bandpass filter
% figure(3);
% wiggle(obs_Uz_filter(1:40:end,1:1:140),'2kK');hold on;
% wiggle(syn_Uz_iter_50_filter(1:40:end,1:1:140),'2rR');hold on;
% %axis ij;
% set(gca,'Xtick',[1 0.5*round(500/9) 1*round(500/9) 1.5*round(500/9) 2*round(500/9) 2.5*round(500/9)]);
% set(gca,'XTickLabel',{'0','0.5','1','1.5','2','2.5'});
% set(gca,'Ytick',[1 0.5*round(nt/1.5/40) 1*round(nt/1.5/40) 1.5*round(nt/1.5/40)]);
% set(gca,'YTickLabel',{'0','0.5','1','1.5'});
% set(gca,'FontName','times','FontSize',26);
% set(gcf,'unit','centimeters','position',[3 1 60 24]);set(gca,'Position',[.06 .15 .9 .8]);
% ylabel('Time (s)','FontName','times','FontSize',26);
% xlabel('Offset (km)','FontName','times','FontSize',26);hold off;
