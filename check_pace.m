% Function to give feedback to the user on their pace
% in terms of the target pace.
function check_pace(target, rev)
    diff = abs(target - rev);
    margin = 3;
    if (rev < (target - margin))
        disp("Speed up, grandpa! You're going " + diff + ...
        " rev/min too slow at a target of " + target + " rev/min.");
    elseif (rev > (target + margin)) 
        disp("Woah, buddy! Slow down! You're going " + diff + ...
        " rev/min too fast at a target of " + target + " rev/min.");
    else
        disp("You're doing great, sweetie :)");
    end
end