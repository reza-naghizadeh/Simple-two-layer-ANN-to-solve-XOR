% Inputs with coordiantes and bias value
input = [0 0 1; 0 1 1; 1 0 1; 1 1 1];
% Desire target
target = [0; 1; 1; 0];

% Learning Rate
LearningRate = 0.5;

% Error surface initial
errorSurface =[];
error1 = 0;

% Weights with bias included with random initial
w1 = [rand, rand, rand; rand, rand, rand];
w2 = [rand, rand, rand];


% Max epoch time
epoch = 50;
for round = 1:epoch
    for i = 1:length(input)
        % Choosing the points and desire target seperetly
        point = input(i, :);
        desireTarget = target(i);

        % Activation functions
        h1 = tansig((point(1) * w1(1,1)) + (point(2) * w1(2,1)) + w1(1,3));
        h2 = tansig((point(1) * w1(1,2)) + (point(2) * w1(2,2)) + w1(2,3));
        h3 = tansig((h1 * w2(1)) + (h2 * w2(2)) + w2(3));

        % Compute error
        error = desireTarget - h3;
        error1 = error1 + error;

        % Compute the deltas
        delta3 = error * h3 * (1 - h3);
        delta2 = delta3 * h2 * (1 - h2);
        delta1 = delta3 * h1 * (1 - h1);

        % Weight correction
        w1(1,1)= w1(1,1) + (LearningRate * delta1 * point(1));
        w1(1,2)= w1(1,2) + (LearningRate * delta2 * point(2));
        w1(1,3)= w1(1,3) + (LearningRate * delta2 + delta1);

        w1(2,1)= w1(2,1) + (LearningRate * delta1 * point(1));
        w1(2,2)= w1(2,2) + (LearningRate * delta2 * point(2));
        w1(2,3)= w1(2,3) + (LearningRate * delta2 + delta1);

        w2(1)= w2(1) + (LearningRate * delta3 * h1);
        w2(2)= w2(2) + (LearningRate * delta3 * h2);
        w2(3)= w2(3) + (LearningRate * delta3);


    end
    % Compute the error surface for each epoch
    errorSurface = [errorSurface; error1];
   
       
end

%Plot the ErrorSurface
 plot(errorSurface);


x = [];
y = [];
for w = 1:length(input)
    xx = input(w, 1);
    yy = input(w, 2);
    x = [x, xx];
    y = [y, yy];
end
x = 1:9;
y = 1:9;
www = [w1; w2];
mesh(reshape(x, [3, 3]), reshape(y, [3, 3]), www);

x = 1:0.25:4;
y = 1:0.25:4;
one = ones([1,13]);
coordinate = [x', y', one'];
for e = 1:length(coordinate)
    point = coordinate(e, :);
    point = point(1, 1:2) * w1;
    point = reshape(point, [3,1]);
    point = point * w2;
end

mesh(point);



