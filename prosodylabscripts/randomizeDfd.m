
function [dfd1, dfd2, dfd3, dfd4]=randomizeDfd(dfd)
% As of March 15, 2018, the DFD and hillenbrand vowel stimuli set has been
% altered
% Now, there are 52 stimuli:
%   40 of the form "aCVd" where C = p t k b d g s S z h (stops and sibliants,
%   excluding voiced palatalalveolar Z; h is included to look at all vowel contexts in neutral consonant context)
%   12 of the form "aCod" where C = f v th dh h ch dj m n l r j w
% As such, dfdListLength now = 13, not 9

    dfd_short = dfd;
    dfdListLength = 13;
    % add column of zeros to identify which rows to remove later
    dfd_short.remove = zeros(length(dfd_short),1);
    % 4 is the number of playlists the dfd will be broken into
    for d=1:4
    %temp = dfd(randsample(length(dfd),dfdListLength),:);
    temp = dfd_short(randsample(length(dfd_short),dfdListLength),:);
    genvarname('dfd',num2str(d));
    eval(['dfd',num2str(d) '= temp']);

    % Iterate over sublist words
    for w=1:length(temp.word)
        current_word = (temp.word(w));
        % Iterate over full list words
        for w2=1:length(dfd_short.word)
        %for w2=1:3
            %disp(w2);
            current_word2 = (dfd_short.word(w2));
            % Find word that appears on sublist
            if current_word2 == current_word
                %disp(['Match!', current_word, " = ", current_word2]);
                %dfd_short(w2,:) = [];
                dfd_short.remove(w2) = 1;
            else
                %disp('No match');
                %disp(current_word);
                %disp(current_word2);
            end
            %disp(size(dfd_short));
        end 
        dfd_short = dfd_short(dfd_short.remove==0,:);
        %disp(length(dfd_short));
    end

    % CHECK IF THIS WORKS FOR NEXT LOOP UP - CAN IT CREATE 4 DFD LISTS?
    % YES. NEXT - ARE THEY UNIQUE??!?! YES!

    end
end