%computing the eigenvalues and eigenvectors/eigenfaces
CovFace1 = DemeanFace * DemeanFace';

%computing the eigenvector and eigenvalues of CovFace1

[EV, ED] = eig(CovFace1);

