# README for XOR Neural Network Code

## Overview

This MATLAB script implements a basic two-layer neural network designed to solve the XOR problem, which is a classic non-linear classification challenge. The code utilizes backpropagation to train the network, adjusting weights to minimize the error between predicted and desired outputs.

This code was developed as part of my Artificial Neural Networks (ANN) course project at IASBS.

---

## Features

- **Input Data**: The script uses a 3-input dataset, where the third value is a bias term.  
- **Target Output**: The target values correspond to the XOR operation for the first two inputs.  
- **Learning Rate**: A constant learning rate of 0.5 controls the weight updates.  
- **Randomized Weights**: Weights are initialized randomly for both layers, including the bias terms.  
- **Activation Function**: The `tansig` activation function is used to introduce non-linearity.  
- **Error Tracking**: The error for each epoch is calculated and stored for visualization.  
- **Visualization**:
  - The error surface over epochs is plotted.
  - The learned decision boundary is visualized in 3D.

---

## Structure and Workflow

1. **Initialization**:
   - Input data and target values are defined.
   - Learning rate, epoch count, and initial weights are set.

2. **Training Loop**:
   - For each epoch, iterate through all input points.
   - Perform forward propagation:
     - Compute hidden layer outputs using the `tansig` activation.
     - Calculate the output layer’s result.
   - Compute the error and backpropagate:
     - Calculate deltas for output and hidden layers.
     - Adjust weights based on deltas and learning rate.
   - Record the total error for the epoch.

3. **Visualization**:
   - Plot the error surface to observe the convergence over epochs.
   - Visualize the decision boundary using a mesh plot.

---

## Requirements

- **MATLAB**: The script is designed for MATLAB environments.
- **Toolbox**: Ensure the Neural Network Toolbox is installed for the `tansig` function.

---

## Usage

1. **Run the Script**:
   - Copy the code into a MATLAB script file.
   - Execute the script in the MATLAB environment.

2. **Modify Parameters**:
   - Adjust the learning rate (`LearningRate`) or epoch count (`epoch`) as needed.
   - Experiment with different initial weights for varied results.

3. **Interpret Outputs**:
   - Observe the error surface plot to evaluate training performance.
   - Examine the decision boundary mesh plot for network performance.

---

## Customization

- **Activation Function**: Change the `tansig` function to other activation functions like `logsig` or `purelin` for experimentation.
- **Dataset**: Replace the XOR dataset with other input-target pairs for different classification problems.
- **Network Topology**: Modify weight matrices to adjust the number of hidden neurons.

---

## Limitations

- The network is hardcoded to solve the XOR problem, and generalization requires modifications.
- The learning rate and weight initialization may affect convergence.