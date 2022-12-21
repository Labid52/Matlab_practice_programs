clc
close all
clear all
mdl = 'scdcstrctrlplant';
open_system(mdl)

C = [2 3 4 5 6 7 8 9]; %output variable based on which operating point 
% specification is generated

op = operspec(mdl, numel(C));%returns an operating point specification object

for ct = 1:numel(C)
    op(ct).Outputs.Known = true
    op(ct).Outputs.y = C(ct)
end

opint = findop(mdl,op,findopOptions('DisplayReport','off'))
Plants = linearize(mdl,opint);
isstable(Plants,'elem');
%controllers design
controllers = pidtune(Plants,'PIDF',1)
controllers(:,:,4)
clsys = feedback(Plants*controllers,1)
%dispaly the output
figure
hold on
for ct = 1:length(C)
    sys = clsys(:,:,ct);
    sys.Name = ['C=', num2str(C(ct))];
    sys.InputName = 'Reference'
    stepplot(sys,20)
end

%changing the frequency from 1 to 10
controllers = pidtune(Plants,'PIDF',10)
controllers(:,:,4)
clsys = feedback(Plants*controllers,1)

figure 
hold on
for ct = 1:length(C)
    sys = clsys(:,:,ct)
    set(sys,'Name',['C=',num2str(C(ct))],'InputName','Reference');
    stepplot(sys,20)
end
legend('show','location','southeast')

clsys_flat = feedback(Plants*controllers(:,:,1),1)
figure
stepplot(clsys,clsys_flat,20)
legend('C-dependent Controllers','Single Controller')


