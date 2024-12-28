function OUT = majority_voting(IN, w_dia)
    for x=1:w_dia:size(IN,1)
        for y=1:w_dia:size(IN,2)
        startx = x;
        endx = min(x + w_dia - 1, size(IN,1));
        starty = y;
        endy = min(y + w_dia - 1, size(IN,2));
         
        SelectedWindow = IN(startx:endx, starty:endy);
        MajorityValue = mode(SelectedWindow(:));
        MajorityWindow = ones(endx - startx + 1, endy - starty + 1) * MajorityValue;
        OUT(startx:endx, starty:endy)= MajorityWindow;
        end
    end
end
