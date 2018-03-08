function [sitSkeleton1, sitSkeleton2]= randomizeSit(sit, sitSkeleton)
    sitSkeleton.text = nominal(sitSkeleton.text);
    sit_short = sit;
    sitListLength = 3;
    % add column of zeros to identify which rows to remove later
    sit_short.remove = zeros(length(sit_short),1);
    
    % Split skeleton into 2 frames: 1- 3 and 4 - 6
    sitSkeleton1 = sitSkeleton([1:3],:);
    sitSkeleton2 = sitSkeleton([4:6],:);
    
    % 2 is the number of playlists the sits will be broken into
    % TO DO: SPLIT INTO 5 - 10 WORD SENTENCES
    for t=1:2
        temp = sit_short(randsample(length(sit_short),sitListLength),:);
        genvarname('sit',num2str(t));
        eval(['sit',num2str(t) '= temp']);

        % Iterate over sublist sentences (rows)
        for s=1:length(temp.sentence)
            current_sent = (temp.sentence(s));
            % Populate sitSkeleton to replace text with actual sentence to
            % be used
            if (t==1)
                sitSkeleton1.text(s) = current_sent;
            elseif (t==2)
                sitSkeleton2.text(s) = current_sent;
            else
                disp(['WTF is going on?!']);
            end
            
            % Iterate over full list words in order to remove sentences
            % already used
            for s2=1:length(sit_short.sentence)
            %for w2=1:3
                %disp(s2);
                current_sent2 = (sit_short.sentence(s2));
                % Find sentence that appears on sublist
                if current_sent2 == current_sent
                    %disp(s2);
                    %disp(['Match!']);
                    %disp(current_sent);
                    %disp(current_sent2);
                    % Mark sentence for removal
                    sit_short.remove(s2) = 1;
                end
                %disp(size(dfd_short));
            end 
            % Remove sentences marked for removal
            % This is to avoid sentences being repeated in a given
            % condition; It does not avoid sentences being repeated across
            % conditions
            sit_short = sit_short(sit_short.remove==0,:);
            %disp(length(dfd_short));
        end
    end
end
