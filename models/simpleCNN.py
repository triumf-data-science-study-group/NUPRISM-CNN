"""
Simple CNN based on Kazu Terao's and Abhishek Abhishek code .
"""

# PyTorch imports
import torch.nn as nn

# KazuNet class
class SimpleCNN(nn.Module):
    
    # Initializer
    
    def __init__(self, num_input_channels=38, num_classes=3, train=True):
        
        # Initialize the superclass
        super(SimpleCNN, self).__init__()
        
        # Activation functions
        self.relu = nn.ReLU()
        self.softmax = nn.Softmax(dim=1)
        
        # Feature extractor
        
        # Convolutions and max-pooling
        self.f_conv1 = nn.Conv2d(num_input_channels, 64, kernel_size=3, stride=1, padding=0)
        self.f_max_pool1  = nn.MaxPool2d(2,2)
        
        self.f_conv2a = nn.Conv2d(64, 64, kernel_size=3, stride=1, padding=0)
        self.f_conv2b = nn.Conv2d(64, 64, kernel_size=3, stride=1, padding=0)
        self.f_max_pool2  = nn.MaxPool2d(2,2)
        
        self.f_conv3a = nn.Conv2d(64, 128, kernel_size=3, stride=1, padding=0)
        self.f_conv3b = nn.Conv2d(128, 128, kernel_size=3, stride=1, padding=0)
        self.f_max_pool3 = nn.Conv2d(128, 128, kernel_size=2, stride=2, padding=1)
        
        self.f_conv4  = nn.Conv2d(128, 128, kernel_size=3, stride=1, padding=1)
        
        # Flattening
        
        # Fully-connected layers
        self.en_fc1 = nn.Linear(128, 128)
        self.en_fc2 = nn.Linear(128, 128)
        self.en_fc3 = nn.Linear(128, num_classes)
        
    # Forward pass
    
    def forward(self, X):
        
        # Convolutions and max-pooling
        x = self.en_max_conv1(self.en_conv1(X))
        x = self.en_max_conv2(self.en_conv2b(self.en_conv2a(x)))
        x = self.en_max_conv3(self.en_conv3b(self.en_conv3a(x)))
        
        x = self.en_conv4(x)
        
        # Flattening
        x = nn.MaxPool2d(x.size()[2:])(x)
        x = x.view(-1, 128)
        
        # Fully-connected layers
        x = self.relu(self.en_fc1(x))
        x = self.relu(self.en_fc2(x))
        x = self.en_fc3(x)
        
        return x
