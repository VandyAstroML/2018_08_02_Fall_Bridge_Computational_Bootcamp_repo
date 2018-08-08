#! /usr/bin/env python
# -*- coding: utf-8 -*-

# Victor Calderon
# Created      : 2018-08-06
# Last Modified: 2018-08-06
# Vanderbilt University
from __future__ import absolute_import, division, print_function 
__author__     = ['Victor Calderon']
__copyright__  = ["Copyright 2018 Victor Calderon, Planck spectrum"]
__email__      = ['victor.calderon@vanderbilt.edu']
__maintainer__ = ['Victor Calderon']
"""

"""
# Importing Modules
import os
import sys
import numpy as np
import matplotlib.pyplot as plt

## Functions

# Dictionary of constants
def const_dict_func():
    """
    Dictionary of constants

    Returns
    ---------
    const_dict : `dict`
        Dictionary of constants
    """
    const_dict = {}
    const_dict['c'] = 3.0e8 # Speed of light
    const_dict['h'] = 6.62e-34 # Planck's constant
    const_dict['k'] = 1.38e-23 # Boltzmann's constant

    return const_dict

# Function for the Planck spectrum
def planck_spectrum(T, wavelen, const_dict):
    """
    Computes the Planck spectrum for a given Temperature and wavelength

    Parameters
    -----------
    T : `float`, `int`
        Temperature used. In units of `Kelvin`

    wavelen : `float`, `int`
        Wavelengths to evaluate

    const_dict : `dict`
        Dictionary with constants used.

    Returns
    -----------
    I : `np.ndarray`, `float`, `int`
        Intensity of the Power spectrum at given temperature and wavelength
    """
    # Constants
    c = const_dict['c']
    h = const_dict['h']
    k = const_dict['k']
    # Radiance
    I = (2 * h * c ** 5) / (wavelen**5)
    I *= 1./(-1. + np.exp((h * c)/(wavelen * k * T)))

    return I

# Plotting data

def plot_planck(data):
    """
    Plots the Planck spectrum

    Parameters
    ------------
    data : `np.ndarray`
        Data containing wavelength and planck spectrum information.
        Shape is (N, 2)
    """
    # Clearing previous figures
    plt.clf()
    plt.close()
    # Initializing figure
    fig = plt.figure(figsize=(8,8))
    ax  = fig.add_subplot(111, facecolor='white')
    # Plotting spectrum
    plt.plot(data[:, 0], data[:, 1], marker='o', color='b', linestyle='',
                label='Planck spectrum')
    #
    # Axis labels
    ax.set_xlabel(r'$\lambda$ [m]', fontsize=20)
    ax.set_ylabel('Intensity', fontsize=20)
    #
    # Showing figure
    plt.show()


def main():
    """
    Main function
    """
    #
    # Dictionary of constants
    const_dict = const_dict_func()
    #
    # Temperature as an input parameter
    T = float(sys.argv[1])
    #
    # Wavelenght
    wavelen_min = 1.e-7 # Minimum wavelength in meters
    waveln_max  = 6.e-5 #Maximum wavelength in meters
    samples     = 100 # Number of steps to output
    #
    # List of wavelengths
    wavelen = np.arange(samples)
    wavelen = wavelen_min + (waveln_max - wavelen_min) * wavelen / float(samples)
    #
    # Computing the radiance
    radiance = planck_spectrum(T, wavelen, const_dict)
    #
    # Stacking the data
    data = np.column_stack((wavelen, radiance))
    #
    ## Saving data to file
    # Definiing output path and checking if it exists
    output_path = '../datafiles'
    if not (os.path.exists(output_path)):
        os.makedirs(output_path)
    # Saving data to file
    np.savetxt('{0}/spectrum.dat'.format(output_path), data)
    #
    # Plotting data
    plot_planck(data)

# Main function
if __name__=='__main__':
    # Main Function
    main()
