function [new_stimuli_struct]=radi_experiment()

% Modified experiment file for RADI experiment
rng shuffle % This needs to be at the beginning of each new script!
%commandwindow

%close all
%clear all

%clc

% RANDOMIZATION SCHEME:
%   Four TASKS per rate condition:
%       DFD
%           4 lists x 9 stim = 36 items in total
%       SIT
%           2 lists x 3 stim = 6 items in total
%       PIC
%           3 prompts
%       CON
%           1 prompt
%           Always last: excluded from randomization
%
%       9 subtasks in total

% CREATE TASK SUBSETS
settings.path_items='1_experiment/';
dataFile='radi_test_2018-02-14.txt';
sitsFile='SITS_5-10.txt';
%data = dataset(tdfread(settings.items "radi_test_2018-02-14.txt"));
data = dataset(tdfread([settings.path_items dataFile]));
data.tasklabel = nominal(data.tasklabel);
data.word = nominal(data.word);
data.text = nominal(data.text);
data.lab = nominal(data.lab);
data.woi = nominal(data.woi);
data.experiment = nominal(data.experiment);

dfd = data(data.tasklabel=='dfd',:);
sitSkeleton = data(data.tasklabel=='sit',:);
sitSkeleton.text = nominal(sitSkeleton.text);
sit = dataset(tdfread([settings.path_items sitsFile]));
% transform sit sentence column to nominal
sit.sentence = nominal(sit.sentence);

picSkeleton = data(data.tasklabel=='pic',:);
picSkeleton.text = nominal(picSkeleton.text);
picSkeleton.word = nominal(picSkeleton.word);
picSkeleton.lab = nominal(picSkeleton.lab);
picSkeleton.woi = nominal(picSkeleton.woi);

conSkeleton = data(data.tasklabel=='con',:);

% Call dfd, sit function:
[dfdList1, dfdList2, dfdList3, dfdList4]=randomizeDfd(dfd);
[sitSkeleton1, sitSkeleton2]= randomizeSit(sit, sitSkeleton);

% Randomize pictures
% This will need to be mixed into the other lists somehow.
% Also need to preserve item #?
picList = randsample(picSkeleton.word, length(picSkeleton));
for p=1:length(picSkeleton)
    picSkeleton.text(p) = picList(p);
    picSkeleton.word(p) = picList(p);
    picSkeleton.lab(p) = picList(p);
    picSkeleton.woi(p) = picList(p);
end


% Remove the "remove" column in the dfdLists (this should really be in
% randomizeDfd)
dfdList1=dfdList1(:,1:end-1);
dfdList2=dfdList2(:,1:end-1);
dfdList3=dfdList3(:,1:end-1);
dfdList4=dfdList4(:,1:end-1);
% Don't really need the ID column, and it's getting mixed up with
% participant in experiment.m
% dfdList1.id = 1;
% dfdList1.id(1:9) = 1;
% dfdList2.id = 2;
% dfdList2.id(1:9) = 2;
% dfdList3.id = 3;
% dfdList3.id(1:9) = 3;
% dfdList4.id = 4;
% dfdList4.id(1:9) = 4;
% sitSkeleton1.id = 5;
% sitSkeleton1.id(1:length(sitSkeleton1)) = 5;
% sitSkeleton2.id = 6;
% sitSkeleton2.id(1:length(sitSkeleton2)) = 6;

% NOW JOIN
%subTasks = [dfdList1; dfdList2; dfdList3; dfdList4; sitSkeleton1;
%sitSkeleton2]; % This concatenates the datasets... better to put each in
%its own cell in a cell array
subTasks = {dfdList1; dfdList2; dfdList3; dfdList4; sitSkeleton1; sitSkeleton2};


%rng shuffle % This needs to be at the beginning of each new script!


r = randperm(length(subTasks));
subTasks_rand = {};
for i = 1:length(r);
    subTasks_rand{i} = subTasks(r(i));
end

subTasks_rand{1:6};
% Access a 1x6 cell array with array{1,c}{1,1}

% Extract each element of the cell array subTasks_rand in order, then
% concatenate them into a single data frame using vertcat

% Create new_stimuli by extracting first element of subTasks_rand
new_stimuli = subTasks_rand{1,1}{1,1};
for t=2:length(subTasks_rand)
    current_list = subTasks_rand{1,t}{1,1};
    new_stimuli = vertcat(new_stimuli, current_list);
end
new_stimuli.experiment = char(new_stimuli.experiment);
new_stimuli.tasklabel = char(new_stimuli.tasklabel);
new_stimuli.word = char(new_stimuli.word);
new_stimuli.text = char(new_stimuli.text);
new_stimuli.lab = char(new_stimuli.lab);
new_stimuli.woi = char(new_stimuli.woi);

new_stimuli_struct = dataset2struct(new_stimuli);
new_stimuli_struct = transpose(new_stimuli_struct);
end





