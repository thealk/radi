rng shuffle
pew =  {'a' 'b' 'c' 'd' 'e' 'f'};
x = randperm(length(pew));



for i = 1:length(x);
    rando{i} = pew(x(i));
end

rando{1:6}
