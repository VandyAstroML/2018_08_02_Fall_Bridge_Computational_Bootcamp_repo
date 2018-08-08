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
import numpy as np
import scipy
import matplotlib.pyplot as plt

# Function for the PDF of distribution
def normpdf(x, mu, sigma):
    """
    PDF of a distribution with a mean and standard deviation
    
    Parameters
    -----------
    x : `np.ndarray`, list
        List/Array of values of the distribution
    
    mu : `float`, `int`
        Mean of the distribution
    
    sigma : `float`, `int`
        Standard deviation of the distribution
    
    Returns
    --------
    y : `np.ndarray` or list
        List/array of the normalized PDF values
    """
    u = (x-mu)/np.abs(sigma)
    y = (1/(np.sqrt(2*np.pi)*np.abs(sigma)))*np.exp(-u*u/2)
    return y

# Function to plot figure
def plot_fit(x, mu, sigma):
    """
    Plots the histogram of `x` and computes the PDF of it.

    Parameters
    -----------
    x : `np.ndarray`, list
        List/Array of values of the distribution
    
    mu : `float`, `int`
        Mean of the distribution
    
    sigma : `float`, `int`
        Standard deviation of the distribution
    """
    # Clearing any previous figure
    plt.clf()
    plt.close()
    # Initialize figure
    fig = plt.figure(figsize=(8,8))
    ax = fig.add_subplot(111, facecolor='white')

    # Creating histogram
    n, bins, patches = plt.hist(x,
                                bins=50,
                                density=True,
                                histtype='stepfilled',
                               facecolor='green',
                               alpha=0.75,
                               label='Normal distr.')

    # Normalized PDF
    y_pdf = normpdf(x, mu, sigma)
    plt.plot(x, y_pdf, 'ro', linestyle='', label='PDF')

    # Adding labels and title
    plt.title(r'Histogram of IQ: $\mu = %s, \sigma = %s$' %(mu, sigma),
             fontsize=20)

    # Setting up axis
    plt.axis([40, 160, 0, 0.03])

    # Adding a grid
    plt.grid(True)

    # Adding legend
    plt.legend(loc='best', prop={'size': 15})
    # Showing plot
    plt.show()

# Functions
def main():
    # Mean and standard deviation
    mu, sigma = 100, 15

    # Array of random values
    x = mu + (sigma * np.random.randn(10000))

    ## Plotting
    plot_fit(x, mu, sigma)

if __name__ == '__main__':
    # Main Function
    main()

