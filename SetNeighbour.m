function CMatrix = SetNeighbour(Row, Colume)
NumSites = int16(Row*Colume);
CMatrix = zeros(NumSites, NumSites);
for i=1:NumSites
    if i+1 <= NumSites && mod(i,Row)~=0
        CMatrix(i,i+1) = 1;
    end
end