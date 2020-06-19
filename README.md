[![Contributors][contributors-shield]][contributors-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<!-- HEADER -->
<br />
<p align="center">
  <a href="#">
    <img src="/doc/images/pitt_SPARC_logo.png" alt="Logo" width="300" height="250">
  </a>
</p>

Supported OS environments:
* Windows (developed and tested on Windows 10)
* Mac  (tested on Mojave 10.14) 
<!--* Linux (in testing) -->

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About](#about)
* [Prerequesites](#prerequesites)
* [Installation](#installation)
* [Using Signal Inspector](#using-signal-inspector)
* [Issues and feedback](#issues-and-feedback)
* [License](#license)
* [Acknowledgements](#acknowledgements)


<!-- ABOUT -->
## About
Pitt SPARC Signal Inspector is a Matlab-based desktop software application intended to assist in the dynamic searching and evaluation of physiological signals. Signal Inspector is designed with a friendly GUI to streamline the data analyis process and integrate into your processing pipeline for [SPARC](https://commonfund.nih.gov/sparc) investigators, including its abilitiy to work with Ripple files.  Signal Inspector has been tested on versions of Matlab 2018 and newer.


## Prerequesites
The application depends on the following packages installed with your Matlab license:
 - [Signal Processing Toolbox](https://www.mathworks.com/products/signal.html) (Required)
 - [Parallel Computing Toolbox](https://www.mathworks.com/products/parallel-computing.html) (Optional) 

## Installation

1. (Windows) Download the repo files (click "Clone or download" and select "Download ZIP")
       OR
   (Mac/Linux) Open a terminal and use git to clone the repo into the specified directory:

        cd ~/path/to/folder
        git clone https://github.com/Jshulgach/Pitt-SPARC-Signal-Inspector
    

2. Pitt SPARC Signal Inspector is distributed as an App which can be easily installed through the use of Matlab's App installer. Open the Matlab UI, click on the "Apps" tab, select "Install App", and navigate to file directory.

## Using Signal Inspector
For a full description and helpful tips with using Signal Inspector, refer to the documentation in the [wiki](https://github.com/Jshulgach/Pitt-SPARC-Signal-Inspector/wiki).

- Supports reading .ns5 and nf3 Ripple file types
- Multiple channels can be read by splitting numbers with comma (2,3,6) or range with colon (1:32).
- All files in specified path will be read sorted by name, except for datafiles excluded by name (ex: datafile0001).
- Press "Load New Data" button to combine raw data files into one continuous vector.
- Clicking on a Channel in the Display dropdown menu will update all figures with new Channel data.
- Data can be saved afterwards as a .mat or .h5 file type.

## Issues and feedback
To report any issues found, suggest improvements, or request a new feature, please open a new issue via the [Issues tab](https://github.com/Jshulgach/Pitt-SPARC-Signal-Inspector/issues).

## License
Signal Inspector is distributed under the MIT License. See [LICENSE](https://github.com/Jshulgach/Pitt-SPARC-Signal-Inspector/blob/master/LICENSE) for more information.

## Acknowledgements
* This work was supported by National Institutes of Health funding (Common fund SPARC Program award U18TR002205)
* [NIH SPARC Initiative](https://commonfund.nih.gov/sparc)
* [SPARC Portal](https://sparc.science/)
* Charles Horn (University of Pittsburgh) - Prelimilary design with graphical figures and data processing pipeline
* Beta testers, including:
  * Michael Sciullo (UPMC Hillman Cancer Center)
  * Stephanie Fulton (UPMC Hillman Cancer Center)


[contributors-shield]: https://img.shields.io/github/contributors/Jshulgach/Pitt-SPARC-Signal-Inspector.svg?style=flat-square
[contributors-url]: https://github.com/Jshulgach/Pitt-SPARC-Signal-Inspector/graphs/contributors
[stars-shield]: https://img.shields.io/github/stars/Jshulgach/Pitt-SPARC-Signal-Inspector.svg?style=flat-square
[stars-url]: https://github.com/Jshulgach/Pitt-SPARC-Signal-Inspector/stargazers
[issues-shield]: https://img.shields.io/github/issues/Jshulgach/Pitt-SPARC-Signal-Inspector.svg?style=flat-square
[issues-url]: https://github.com/Jshulgach/Pitt-SPARC-Signal-Inspector/issues
[license-shield]: https://img.shields.io/github/license/Jshulgach/Pitt-SPARC-Signal-Inspector.svg?style=flat-square
[license-url]: https://github.com/Jshulgach/Pitt-SPARC-Signal-Inspector/blob/master/LICENSE
