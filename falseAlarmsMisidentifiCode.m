%% Code to store and plot the indices and data classes that are misidentified 
% and false alarmed.

% get the test data indices
testind = info.test.indices;

% filter the output values with the same indices 
testoutput = output(testind);

% filter the 'f' values with the test data indices
testf = f(testind);

% fiter the 'Target' values with the test data indices
testtarget = Target(testind);
testtarget = testtarget;

% convert the output matrix to round off 
% all the values in output matrix less than 0.5 are 0 and values > = 0.5
% are 1.
NNclassification = round(output);

% store all the classification data corr. to the test data
testNNclassification = NNclassification(testind);

% make a new indices vector for the test data
% containing values from 1 to the length of the vector
testindnew = 1:length(testind); 

% False alarm cases when output = 1(cloudy) but testtarget = 0(clear)
ind_false_alarm = testindnew(testNNclassification == 1 & testtarget == 0); % contains indices of false alarm data in the test data.
false_alarm_output = testoutput(ind_false_alarm);
false_alarm_f = testf(ind_false_alarm);

% Misidentification cases when output = 0(clear) but Target = 1(cloudy)
ind_misid = testindnew(testNNclassification == 0 & testtarget == 1); % contains indices of misidentified cases in the test data.
misid_output = testoutput(ind_misid);
misid_f = testf(ind_misid);


figure
scatter(misid_f',misid_output)
xlabel('f')
ylabel('output')
title('misidentified')
figure
scatter(false_alarm_f',false_alarm_output)
xlabel('f')
ylabel('output')
title('false alarm')
figure
scatter(testf,testoutput)
hold on 
x = 0:0.01:1;
plot(x,x);

