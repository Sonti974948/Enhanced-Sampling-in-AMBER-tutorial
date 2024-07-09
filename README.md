# Enhanced-Sampling-in-AMBER-tutorial
Tutorials on AMBER based Metadynamics and Gaussian Accelerated MD (GaMD) simulations on Chignolin.
For running AMBER metadynamics, please refer to the first half of this [video](https://youtu.be/UFqUJcnxXUQ?feature=shared)

## General information
1. ````chignolin.pdb````, ````chignolin.prmtop```` and ````chignolin.rst```` are the input files required for the AMBER simulation.
2. ````md.in```` is the AMBER run file, which contains the details of the simulation. The parameters that you can vary are \
   a. ````ntpr = 500   ! write energy information every 500 steps to log file```` \
      ````ntwx = 500   ! write coordinates every 500 steps to a trajectory file```` \
      ````ntwr = 500   ! write restart file every 500 steps to corresponding file ````
      
   b. ````nstlim = 2000000 ! perform 2000000 MD steps```` \
      ````dt = 0.002     ! use time steps of 2fs````

## Metadynamics 
1. Apart from the above input files, a ````plumed.dat```` file is also important, as it has the information about the paramters to be used in a metadynamics simulation. An example file has been given in this repo.
2. To run PLUMED on AMBER, the following commands are required in md.in: \
     ````plumed = 1 ! Plumed will run```` \
     ````plumedfile="plumed.dat" ! Name of the plumed.dat which AMBER has to access````
3. To run the simulation after preparing all the files, run ````sbatch run.sh````. The ````run.sh```` should contain the AMBER run command, the ````export PLUMED_KERNEL```` command and all the relevant modules and SBATCH headers. An example file has been provided.
4. 2 PLUMED output files will be produced. ````COLVAR```` file will have the information about the collective variables and the bias added, while ````HILLS```` file will have the details of the gaussian bias potentials that were added over the simulation.
5. Run ```` plumed sum_hills --hills HILLS --mintozero --min 0 --max 10 --bin 200```` to get the ````fes.dat```` file that has the reweighted free energy profile.

## Gaussian Accelerated Molecular Dynamics (GaMD) 
1. To run GaMD on AMBER, additional commands have to be added to md.in (Please see the !! GAMD settings section of md.in in the GaMD folder of this repository)
2. To run the simulation after preparing all the files, run ````sbatch run.sh````. The ````run.sh```` should contain the AMBER run command and the relevant modules and SBATCH headers. An example file has been provided.
3. 2 GaMD output files will be produced. ````gamd.log```` is the file that stores all the potential energy information through the simulation, and ````gamd-restart.dat```` are the [GaMD parameters](https://pubs.acs.org/doi/10.1021/acs.jctc.5b00436) that the simulation uses.
4. Run the command ````cpptraj -i analysis.cpptraj```` to get the ````rmsd.dat```` and/or ````rg.dat```` (Radius of gyration) information from the simulation. You have to do ````conda activate AmberTools23```` in order to access the ````cpptraj```` command.
     
