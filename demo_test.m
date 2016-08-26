%%     demo for MLRsub algorithm
%
%%    Spectral–Spatial Hyperspectral Image Segmentation Using 
%%    Subspace Multinomial Logistic Regression and Markov Random Fields
%
% Author: Jun Li
%         Jose M. Bioucas-Dias
%         Antonio Plaza,  Dec. 2011

% More details in:
%
% Li, J.; Bioucas-Dias, J. M.; Plaza, A.; , "Spectral–Spatial Hyperspectral
% Image Segmentation Using Subspace Multinomial Logistic Regression and 
%  Markov Random Fields," Geoscience and Remote Sensing, IEEE Transactions 
%  on , vol.PP, no.99, pp.1-15, 0  doi: 10.1109/TGRS.2011.2162649
%
%

close all
clear all
clc

% spatial prior parameter
beta    = 1.0;
%  number of classes
 no_classes       = 16;
% parameter controlling the spectral information
tau=190;
% number of labeled samples
no_train = 1036;

% ground truth image; and AVIRIS Indiana Pines image
% load AVIRIS_Indiana_16class
load imgreal;
im = img;
clear img;

% size of image
sz = size(im);

im = ToVector(im);
im = im';
im([104:108 150:163 220],:) =[];

% load TGRS_AVIRSI_hysimeim9pc   
% number of bands and number of samples
[l_all n_all]= size(im);

% ground truth image
load AVIRIS_Indiana_16class
trainall = trainall';


    %  randomly select training samples from the ground truth image
 indexes=train_test_random_new(trainall(2,:),60,1036);
 n_train = size(indexes,1);
 
 train1 = trainall(:,indexes);
   y=train1(2,:);
    train = im(:,train1(1,:));
 
 % the remaining used for test
 test1 = trainall;
    test1(:,indexes) = [];  

    
    
 

%%  subspace classifier
 g = [];
  g_all= [];
  
  % number of classes
        k=max(y);
        for k_iter = 1:k
            index_k = train1(2,:) == k_iter;
            train_k = train(:,index_k);     
            n_k   = size(train_k,1);
            [v,d]   = eig(train_k*train_k'/n_k);
            d = diag(d);
            
            
            P = v(:,1:tau)*v(:,1:tau)'*train;
            gall = zeros(1,n_train);
            
            for num_k = 1:n_train
                gall(num_k) = sqrt(P(:,num_k)'*P(:,num_k));
            end
            g = [g; gall];
            
            ggall=zeros(1,n_all);

            P_all = v(:,1:tau)*v(:,1:tau)'*im;
            
            for iter_all = 1:n_all
                ggall(iter_all) = sqrt(P_all(:,iter_all)'*P_all(:,iter_all));
            end
            g_all = [g_all;ggall];
        end
        
        
        % regularization parameter
        lambda = 0.00000001;
        w = subspace_classifier(-g,y,lambda);

        % compute the probablity
        p= subspace_mlogistic(w,-g_all);
        
                [maxp,class] = max(p);
        [OA_class,kappa_class,AA_class,CA_class] = calcError( test1(2,:)-1, class(test1(1,:))-1, 1: no_classes);


        
    %% segmentation

        Dc = reshape((log(p+eps))',[sz(1) sz(2) k]);

        Sc = ones(k) - eye(k);        

        % Expantion Algorithm
        gch = GraphCut('open', -Dc, beta*Sc);
        [gch seg] = GraphCut('expand',gch);
        gch = GraphCut('close', gch);

        [OA_seg,kappa_seg,AA_seg,CA_seg] = calcError( test1(2,:)-1, seg(test1(1,:)), 1: no_classes);
