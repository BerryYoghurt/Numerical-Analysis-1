function sim = output(out, bool)
    if (bool == true)
        l = size(out,1);
        sim = '';
        for i = 1:l
            sim = sprintf('%s \n%s', sim, num2str(out(i,:)));
        end
    end
end