function sim = output(out, bool)
    sim = '';%put it here so that sim would be assigned even if bool is false
    if (bool == true)
        l = size(out,1);
        %sim = '';
        for i = 1:l
            %sim = sprintf('%s \n%s', sim, num2str(out(i,:)));
            sim = sprintf('%s \n%s', sim, char(out(i,:)));
        end
    end
end