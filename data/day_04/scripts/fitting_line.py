#! /usr/bin/env python
# -*- coding: utf-8 -*-

# Victor Calderon
# Created      : 2018-08-06
# Last Modified: 2018-08-06
# Vanderbilt University
from __future__ import absolute_import, division, print_function 
__author__     = ['Victor Calderon']
__copyright__  = ["Copyright 2018 Victor Calderon, Fitting a line"]
__email__      = ['victor.calderon@vanderbilt.edu']
__maintainer__ = ['Victor Calderon']
"""
Fits a line from the data
"""

## Importing modules
import matplotlib
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

# Function for fitting a line
def myline(x, m, b):
    """
    Functional form of a straight line
    
    Parameters
    -----------
    x : `float`, `int`, `np.ndarray`, list
        Variable that tells you how far along
    
    m : `float`, `int`
        Slope or gradient
    
    b : `float`, `int`
        Y-intercept
    
    Returns
    ---------
    y : `float`, `int`, `np.ndarray`, list
        Value for how far up on the y-axis
    """
    y = (m * x) + b
    
    return y

# Function to plot figure
def plot_fit(x1, y1, bestfit):
    """
    Plots the best-fit line for data

    Parameters
    -----------
    x1, y1 : `np.ndarray`
        Arrays for x- and y-values of the data

    bestfit : list, `np.ndarray`
        List of best-fit parameters from `scipy.optimize.curve_fit` function
    """
    # Clearing any previous figure
    # Initializing figure (optional)
    fig = plt.figure(figsize=(8,8), facecolor='white')
    ax  = fig.add_subplot(111, facecolor='white')

    # Plotting values
    plt.plot(x1, myline(x1, *bestfit), 'r--', linewidth=2, label='Best fit')
    plt.plot(x1, y1, 'bo', label='Data')

    # Setting up limits
    plt.xlim((-1, 21)) # Limit the x-range of our plot

    # Axis labels
    plt.xlabel('This is the x-label', fontsize=20)
    plt.ylabel('This is the y-label', fontsize=20)

    # Maybe add a title
    plt.title('You can also add a title with color',
              fontsize=20,
              color='blue')

    # And finally, a legend:
    plt.legend(loc='best')
    #
    # Showing plot
    plt.show()

# Functions
def main():
    # Defining path
    data_path = '../data/'

    # Reading information
    x1, y1 = np.genfromtxt('../data/dataset1.txt',
                          unpack=True,
                          dtype=np.float)

    ## Calculating best-fit parameters
    bestfit, covar_matrix = curve_fit(myline, x1, y1, p0 = [1.0, 1.0])

    ## Printing out best-fit parameters
    print("Best-fit parameters: m = {0} and b = {1}".format(*bestfit))

    ## Plotting
    plot_fit(x1, y1, bestfit)

if __name__ == '__main__':
    # Main Function
    main()

