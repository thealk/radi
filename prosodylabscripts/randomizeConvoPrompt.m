function [promptSkeleton]= randomizeConvoPrompt(prompt, promptSkeleton)
    promptSkeleton.text = nominal(promptSkeleton.text);
    prompt_short = prompt;
    promptListLength = 3;
    % add column of zeros to identify which rows to remove later
    prompt_short.remove = zeros(length(prompt_short),1);

    temp = dataset(); 

     prompt_short_temp = prompt_short;
     current_prompt = prompt_short_temp(randsample(length(prompt_short_temp),1),:);
     temp = vertcat(temp, current_prompt);


    prompt = temp;
    current_prompt = temp.sentence(1);
    promptSkeleton.text(1) = current_prompt;

    prompt_short = prompt_short(prompt_short.remove==0,:);
   
end
