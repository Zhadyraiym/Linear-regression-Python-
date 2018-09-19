
raw_data = xlsread('azamat_public_data');
[r c] = size(raw_data);
random = rand(1,r);
a = 1;
b = 1;
for i=1:r
    if (random(1,i)>0.3)
        Training(a,:) = raw_data(i,:);
        a = a + 1;
    else
        Test(b,:) = raw_data(i,:);
        b = b + 1;
    end
end
%dividing into dependent and independent sets (training)
dep_tr = Training(:,1);
indep_tr = Training(:,2:15);
%dividing into dependent and independent sets (test)
dep_test = Test(:,1);
indep_test = Test(:,2:15);
%finding coefficients
indep_tr_ones = [ones(length(indep_tr),1) indep_tr];
coef = regress(dep_tr,indep_tr_ones);
%finding predicted y
predicted = [ones(length(indep_test),1) indep_test]*coef;
%finding r^2
Rsq1 = 1 - sum((dep_test - predicted).^2)/sum((dep_test - mean(dep_test)).^2)
%calculating area under curve


