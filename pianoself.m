c1=double(piano_c)/2^15;
sigma=2^(1/12);
s=[0 2 4 5 7 9 11 12];
scores=[1 3 3 3 2 1 1 3 4 1 2 3 3 2 1 1 3 2 2 4 ];
for i=1:22
if scores(i)~=0
pause(0.50);
p=scores(i);
sound(c1,44100*sigma^(s(p)));
else
pause(0.50);
end
end