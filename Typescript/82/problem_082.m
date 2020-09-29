data = textscan (stdin, '%s');
data= ([data{1}(2:2:end),data{1}(3:2:end)]);
distance = [];

function dist=lev_distance(str1,str2)
  L1=length(str1)+1;
  L2=length(str2)+1;
  L=zeros(L1,L2);

  L(:,1)=([0:L1-1]*1)';
  L(1,:)=[0:L2-1]*1;

  for x=2:L1
    for y=2:L2
      if(str1(x-1)==str2(y-1))
        score=0;
      else
        score=1;
      end

        d1=L(x-1,y-1) + score;
        d2=L(x-1,y) + 1;
        d3=L(x,y-1) + 1;
        L(x,y)=min(d1,min(d2,d3));

      end

      end

  dist=L(L1,L2);

end

for i = 1:size(data,1)
  str1 = cell2mat(data(i,1));
  str2 = cell2mat(data(i,2));

  distance(i) = lev_distance(str1,str2);
end

