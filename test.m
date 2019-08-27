% bso test

%funStr = 'rastrigin'; %output worksheet name
%funName = @rastrigin; % fitness function name
%n_p = 500;    % population size
%n_d = 2;    % dimension
%n_c = 5;    % number of clusters
%rang_l = -100;    % left of dynamic range
%rang_r = 100;    % right of dynamic range
%max_iteration = 50;    % maximal number of iterations

warning off all

M=2;
N=2;
n_p=10;
%n_p=a1 a2 a3 …… b1 b2 b3


n_d=N+M;%n_p=a1 a2 a3 4 5 ……0 b1 b2 b3 4 5
rang_r=12;
rang_l=-12;%0-12




n_c = 5;    % number of clusters

%funStr = 'sphere10D5C'; %output worksheet name
%funName = @sphere; % fitness function name
%rang_l = -100;    % left of dynamic range sphere
%rang_r = 100;    % right of dynamic range

funStr = '10D5C'; %output worksheet name
funName = @fitness; % fitness function name

max_iteration = 1480;    % maximal number of iterations

for idx = 1:25 % run times
    fit = bso2(funName,n_p,n_d,n_c,rang_l,rang_r,max_iteration);  %run BSO one time
    if idx <27
        str = native2unicode(idx + 64);
    else % assume idx <53
        str =['A',native2unicode(idx + 38)];
    end
    xlswrite('bso.xls',fit,funStr, [str,'1']); % output best fitness over generation to EXCEL worksheet for each BSO run
    ['run', num2str(idx)]
end
