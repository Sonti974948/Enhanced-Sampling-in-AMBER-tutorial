# Enhanced-Sampling-in-AMBER-tutorial
Tutorials on AMBER based Metadynamics and Gaussian Accelerated MD (GaMD) simulations on Chignolin.
For running AMBER metadynamics, please refer to the first half of this [video](https://youtu.be/UFqUJcnxXUQ?feature=shared)

## General information
1. ````chignolin.pdb````, ````chignolin.prmtop```` and ````chignolin.rst```` are the input files required for the AMBER simulation.
2. ````md.in```` is the AMBER run file, which contains the details of the simulation. The parameters that you can vary are \
   a. ````ntpr = 500   ! write energy information every 10000 steps to log file
         ntwx = 500   ! write coordinates every 10000 steps to a trajectory file
         ntwr = 500   ! write restart file every 10000 steps to corresponding file````
      
   b. ````nstlim = 2000000 ! perform 50000 MD steps
         dt = 0.002     ! use time steps of 2fs````
     
