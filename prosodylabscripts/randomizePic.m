function [pic1, pic2, pic3]= randomizePic(pic)
    pic_short = pic;
    sitListLength = 3;
    % add column of zeros to identify which rows to remove later
    pic_short.remove = zeros(length(pic_short),1);
    
    % 2 is the number of playlists the sits will be broken into
    % TO DO: SPLIT INTO 5 - 10 WORD SENTENCES
    for t=1:2
        temp = pic_short(randsample(length(pic_short),sitListLength),:);
    end
end