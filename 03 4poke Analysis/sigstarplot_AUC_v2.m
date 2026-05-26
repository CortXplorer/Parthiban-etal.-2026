%% Function for plotting with significant stars
% Inputs will be the significance star values
% Output will be plot with significant stars
% This function is only used for """Area under the curves"""

% Note: ons (omitting ns is used to get rid of ns in statistics), ons = 0 for with ns and ons = 1 without ns
% Start and end values determines the positions of the astreiks

function sigstarplot_AUC_v2(Sigstar,ons,start_value,end_value)

%Getting the xticks and yticks
% yt = get(gca, 'YTick'); %% not used in this version of script %%
xt = get(gca, 'XTick');

diff = (end_value-start_value)./5;
pl_vec = start_value:diff:end_value;
line_diff = diff./4;
astk_value = (end_value-start_value)./20;


if ons == 0

    %Plotting the lines for the comparisons
    plot(xt([1 2]), [pl_vec(1) pl_vec(1)], '-k','LineWidth',2)
    plot(xt([1 3]), [pl_vec(4) pl_vec(4)], '-k','LineWidth',2)
    plot(xt([1 4]), [pl_vec(6) pl_vec(6)], '-k','LineWidth',2)
    plot(xt([2 3]), [pl_vec(2) pl_vec(2)], '-k','LineWidth',2)
    plot(xt([2 4]), [pl_vec(5) pl_vec(5)], '-k','LineWidth',2)
    plot(xt([3 4]), [pl_vec(3) pl_vec(3)], '-k','LineWidth',2)

    %Plotting the edges of the lines for the comparisons
    plot([1;1]*xt(1),[pl_vec(1)-line_diff,pl_vec(1)],'-k',...
        [1;1]*xt(1),[pl_vec(4)-line_diff,pl_vec(4)],'-k',...
        [1;1]*xt(1),[pl_vec(6)-line_diff,pl_vec(6)],'-k',...
        [1;1]*xt(2),[pl_vec(2)-line_diff,pl_vec(2)],'-k',...
        [1;1]*xt(2),[pl_vec(5)-line_diff,pl_vec(5)],'-k',...
        [1;1]*xt(3),[pl_vec(3)-line_diff,pl_vec(3)],'-k','LineWidth',2);  %left edge drops

    plot([1;1]*xt(2),[pl_vec(1)-line_diff,pl_vec(1)],'-k',...
        [1;1]*xt(3),[pl_vec(4)-line_diff,pl_vec(4)],'-k',...
        [1;1]*xt(4),[pl_vec(6)-line_diff,pl_vec(6)],'-k',...
        [1;1]*xt(3),[pl_vec(2)-line_diff,pl_vec(2)],'-k',...
        [1;1]*xt(4),[pl_vec(5)-line_diff,pl_vec(5)],'-k',...
        [1;1]*xt(4),[pl_vec(3)-line_diff,pl_vec(3)],'-k','LineWidth',2);  %right edge drops

    %Including the significance stars in the plot
    text(mean(xt([1 2])), pl_vec(1)+astk_value, Sigstar{1},'FontName','Times New Roman','FontSize',15)
    text(mean(xt([1 3])), pl_vec(4)+astk_value, Sigstar{2},'FontName','Times New Roman','FontSize',15)
    text(mean(xt([1 4])), pl_vec(6)+astk_value, Sigstar{3},'FontName','Times New Roman','FontSize',15)
    text(mean(xt([2 3])), pl_vec(2)+astk_value, Sigstar{4},'FontName','Times New Roman','FontSize',15)
    text(mean(xt([2 4])), pl_vec(5)+astk_value, Sigstar{5},'FontName','Times New Roman','FontSize',15)
    text(mean(xt([3 4])), pl_vec(3)+astk_value, Sigstar{6},'FontName','Times New Roman','FontSize',15)

elseif ons == 1

    for Ss = 1:length(Sigstar)

        logic_ans = strcmp(Sigstar{Ss}, 'ns'); %to check the logic, for ns, logic is 1, for no ns, logic is 0

        if logic_ans == 1
            continue

        elseif logic_ans == 0

            if Ss == 1
                plot(xt([1 2]), [pl_vec(1) pl_vec(1)], '-k','LineWidth',2); plot([1;1]*xt(1),[pl_vec(1)-line_diff,pl_vec(1)],'-k','LineWidth',2); plot([1;1]*xt(2),[pl_vec(1)-line_diff,pl_vec(1)],'-k','LineWidth',2); %Line, left edge, right edge
                text(mean(xt([1 2]))-0.1, pl_vec(1)+astk_value, Sigstar{1},'FontName','Times New Roman','FontSize',15) %Sig star

            elseif Ss == 2
                plot(xt([1 3]), [pl_vec(4) pl_vec(4)], '-k','LineWidth',2); plot([1;1]*xt(1),[pl_vec(4)-line_diff,pl_vec(4)],'-k','LineWidth',2); plot([1;1]*xt(3),[pl_vec(4)-line_diff,pl_vec(4)],'-k','LineWidth',2); %Line, left edge, right edge
                text(mean(xt([1 3]))-0.1, pl_vec(4)+astk_value, Sigstar{2},'FontName','Times New Roman','FontSize',15) %Sig star

            elseif Ss == 3
                plot(xt([1 4]), [pl_vec(6) pl_vec(6)], '-k','LineWidth',2); plot([1;1]*xt(1),[pl_vec(6)-line_diff,pl_vec(6)],'-k','LineWidth',2); plot([1;1]*xt(4),[pl_vec(6)-line_diff,pl_vec(6)],'-k','LineWidth',2); %Line, left edge, right edge
                text(mean(xt([1 4]))-0.1, pl_vec(6)+astk_value, Sigstar{3},'FontName','Times New Roman','FontSize',15) %Sig star

            elseif Ss == 4
                plot(xt([2 3]), [pl_vec(2) pl_vec(2)], '-k','LineWidth',2); plot([1;1]*xt(2),[pl_vec(2)-line_diff,pl_vec(2)],'-k','LineWidth',2); plot([1;1]*xt(3),[pl_vec(2)-line_diff,pl_vec(2)],'-k','LineWidth',2); %Line, left edge, right edge
                text(mean(xt([2 3]))-0.1, pl_vec(2)+astk_value, Sigstar{4},'FontName','Times New Roman','FontSize',15) %Sig star

            elseif Ss == 5
                plot(xt([2 4]), [pl_vec(5) pl_vec(5)], '-k','LineWidth',2); plot([1;1]*xt(2),[pl_vec(5)-line_diff,pl_vec(5)],'-k','LineWidth',2); plot([1;1]*xt(4),[pl_vec(5)-line_diff,pl_vec(5)],'-k','LineWidth',2); %Line, left edge, right edge
                text(mean(xt([2 4]))-0.1, pl_vec(5)+astk_value, Sigstar{5},'FontName','Times New Roman','FontSize',15) %Sig star

            elseif Ss == 6
                plot(xt([3 4]), [pl_vec(3) pl_vec(3)], '-k','LineWidth',2); plot([1;1]*xt(3),[pl_vec(3)-line_diff,pl_vec(3)],'-k','LineWidth',2); plot([1;1]*xt(4),[pl_vec(3)-line_diff,pl_vec(3)],'-k','LineWidth',2); %Line, left edge, right edge
                text(mean(xt([3 4])-0.1), pl_vec(3)+astk_value, Sigstar{6},'FontName','Times New Roman','FontSize',15) %Sig star
            end
        end
    end
end


end