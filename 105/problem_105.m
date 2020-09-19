
data = textscan (stdin, '%s');
data= str2double([data{1}(2:2:end),data{1}(3:2:end)]);
    if length(data) != 0
      det1 = [data; data(1,:)];

      for i = 1:length(data)
        term(i) = det1(i,1)*det1(i+1,2);
        term2(i) = det1(i,2)*det1(i+1,1);

      end
    A = 1/2*(sum(term)-sum(term2));
  end

