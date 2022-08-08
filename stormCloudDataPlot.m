% Script to plot storm cloud data 

k = 1;


for i = 3620:3670
for j = 1000:1030
dop(k) = Zdolp(j,i);
rad(k) = Zradiance(j,i);
NNop(k) = Z(j,i);
SA(k) = Zsa(j,i);
k = k+1;
end
end


m = 1;
for i = 3475:3520
for j = 935:985
dopC(m) = Zdolp(j,i);
radC(m) = Zradiance(j,i);
NNopC(m) = Z(j,i);
SAC(m) = Zsa(j,i);
m = m+1;
end
end