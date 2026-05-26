%% Function for giving significance stars by computing ttest (two sample) for bonferroni corrected p-values
% Inputs will a matrix which contains the data
% Output will be significance stars

%%% Note: This calculates bonferroni corrected p-values for n groups (n(n-1)/2 comaprisons) %%%

function Sigstar = bonfer_ttest2(matrx_data)

Sig = matrx_data;            %initializing a matrix for storing the significance values
Col = size(matrx_data,2);    %finding how many columns are there in the matrix
Num_comp = (Col*(Col-1))/2;  %calculating the number of comparisons possible
pval = zeros(1,Num_comp);    %initializing a matrix for p-values
Sigstar = cell(1,Num_comp);  %initializing a matrix for significance stars
index = 1;                   %initializing an index to keep track of pval positions


for i = 1:Col-1
    for j = i+1:Col

        % Compute the p-value between columns i and j using ttest (two sample test)
        [~, p] = ttest2(Sig(:,i), Sig(:,j));  %two sample ttest
        pval(index) = p;                      %store the p-value

        % Adding significance stars based on the p-value threshold
        if p < 0.001/Num_comp
            Sigstar{index} = '***';
        elseif p < 0.01/Num_comp
            Sigstar{index} = '** ';
        elseif p < 0.05/Num_comp
            Sigstar{index} = ' * ';
        else
            Sigstar{index} = 'ns';
        end
        
        index = index + 1;  % move to the next position in pval
    end
end

end
