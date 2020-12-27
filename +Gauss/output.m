function sim = output(out, bool)
    sim = '';%put it here so that sim would be assigned even if bool is false
    if (bool == true)
        [n,m] = size(out);
        
        for i = 1:n
%             sim = sprintf('%s\n',sim); was trying something
%             for j = 1:m
%                 sim = sprintf('%s%s\t',sim , char(out(i,j)));
%             end
            %sim = sprintf('%s \n%s', sim, num2str(out(i,:)));
            sim = sprintf('%s \n%s', sim, char(out(i,:)));
        end
    end
end