% This set of files contains the Matlab code
% for the Bayesian supervised segmentation algorithm intoduced in the paper
%
%
%
% Li, J.; Bioucas-Dias, J. M.; Plaza, A.; , "Spectral–Spatial Hyperspectral
% Image Segmentation Using Subspace Multinomial Logistic Regression and 
%  Markov Random Fields," Geoscience and Remote Sensing, IEEE Transactions 
%  on , vol.PP, no.99, pp.1-15, 0  doi: 10.1109/TGRS.2011.2162649
%
% Files:
%                    readme.m   -  this file
%          demo_test_AVIRIS.m   -  Matlab demo over real AVIRIS Indiana Pines dataset
%          demo_test_PaviaU.m   -  Matlab demo over real ROSIS Pavia University dataset
%       subspace_classifier.m   -  Matlab function file for subspace MLR algorithm
%     train_test_random_new.m   -  Matlab function to randomly  select
%                                  training and testing set
%        subspace_mlogistic.m   -  Matlab function to compute the
%                                  multinomial distributions (one per sample)
%                  ToMatrix.m   -  Matlab function to reshape a vector
%                                  to a matrix 
%                  ToVector.m   -  Matlab function to reshape a matrix
%                                  to a vector
% 
%   AVIRIS_Indiana_16class.mat,AVIRIS_Indiana_imgreal.mat - Matlab data file with AVIRIS
%                                            Indiana Pines dataset
%
%
%  PaviaU_im.mat, PaviaU_trainall.mat, PaviaU_test.mat    - Matlab data
%  files for ROSIS Pavia University dataset
%
%
%             GCmex1.2.tar.gz   -  Matlab Wrapper for Graph Cuts
%                                  http://www.wisdom.weizmann.ac.il/~bagon/matlab.html
%
%%                 reference.bib   -  References. If you use this demo, please
%%                                  cite these references.
%
%  Any suggestions and comments are appreciated, and please send them to the
%  authors: jun@lx.it.pt. bioucas@lx.it.pt aplaza@unex.es