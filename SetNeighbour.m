function CMatrix = SetNeighbour(Row, Colume)
NumSites = int32(Row*Colume);
CMatrix = zeros(NumSites, NumSites);
for i=1:NumSites
    if i+1 <= NumSites && mod(i,Row)~=0
        CMatrix(i,i+1) = 1;
    end
    if i+Colume <= NumSites
        CMatrix(i, i+Colume) = 1;
    end
end