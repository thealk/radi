% Modified experiment file for RADI experiment

commandwindow

close all
clear all

clc

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
dfdFile='radi_test_2018-02-14.txt';
sitsFile='SITS_5-10.txt';
%data = dataset(tdfread(settings.items "radi_test_2018-02-14.txt"));
data = dataset(tdfread([settings.path_items dfdFile]));
data.tasklabel = nominal(data.tasklabel);
data.word = nominal(data.word);

dfd = data(data.tasklabel=='dfd',:);
%sit = data(data.tasklabel=='sit',:);
sit = dataset(tdfread([settings.path_items sitsFile]));
% transform sit sentence column to nominal
sit.sentence = nominal(sit.sentence);
pic = data(data.tasklabel=='pic',:);
con = data(data.tasklabel=='con',:);

% Call dfd, sit function:
[dfdList1, dfdList2, dfdList3, dfdList4]=randomizeDfd(dfd);
[sitList1, sitList2]= randomizeSit(sit);
% Randomize pictures
% This will need to be mixed into the other lists somehow.
picList = randsample(pic.word, length(pic));


% For 7 rate conditions, create 7 playlists
taskList = ["dfdList1", "dfdList2", "dfdList3","dfdList4", "sitList1", "sitList2", "pic1", "pic2", "pic3"];
playlist = randperm(length(taskList));

% Each row = 1 playlist of 9 items; 7 rows (conditions) in total
for i=1:7
% Randomize blocks: dfdList 1-4, sitList 1-2, pic 1-3
    
    rTaskList = randperm(length(taskList));
    for j=1:length(taskList)
                %newList(i)=playList{exper}(rTrial(i));
                newList(j) = taskList(rTaskList(j));
    end
    playlist = vertcat(playlist, newList);
end

% Combine into playlist



