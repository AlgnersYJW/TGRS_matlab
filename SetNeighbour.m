function conMatrix = SetNeighbour(row, colume)
NumSites = row*colume;
conMatrix = sparse(NumSites, NumSites);

%one order neighbors setting
% for i=1:NumSites
%     if i+1 <= NumSites && mod(i,Colume)~=0
%         CMatrix(i,i+1) = 1;
%     end
%     if i+Colume <= NumSites
%         CMatrix(i, i+Colume) = 1;
%     end
% end

%one and two order neighbors setting
for i=1:NumSites
    if i+1 <= NumSites && mod(i,colume)~=0
        conMatrix(i,i+1) = 1;
    end
    if i+colume-1 <= NumSites && mod(i,colume)~=1
        conMatrix(i,i+colume-1) = 1;
    end
    if i+colume <= NumSites
        conMatrix(i,i+colume) = 1;
    end
    if i+colume+1 <= NumSites && mod(i,colume)~=0
        conMatrix(i,i+colume+1) = 1;
    end
end

    
    
