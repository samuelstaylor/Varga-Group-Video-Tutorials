# Varga-Group-Video-Tutorials
YouTube video tutorials for the Varga Group computational nanoscience.

**Video Playlist** This playlist consists of all the video tutorials for the group:

[https://youtube.com/playlist?list=PLlJvCT0DQtXvG7DHvCXf3cwxhCzBJ0mu1&si=DJteA9oKqwo4X2SI](https://youtube.com/playlist?list=PLlJvCT0DQtXvG7DHvCXf3cwxhCzBJ0mu1&si=DJteA9oKqwo4X2SI)

See descriptions for each video below:


**Part 1 - DFT Ground State Calculation** Varga Group Tutorials Part 1 - DFT Ground State Calculation

[https://youtu.be/LZXg4nj4XD4?si=W-lRHDyLUrkaKqPi](https://youtu.be/LZXg4nj4XD4?si=W-lRHDyLUrkaKqPi)

- **Process Summary**: 
  - You need 3 files for the groundstate calculation: **control.inp, dft.inp, job_script.sh**
  - Edit the **dft.inp** file to ensure that the proper **number of atoms** for the molecule is correct as well as the **positions (x,y,z)** and **atomic numbers** of each of the atoms.
    - Use the following link to get equilibrium geometry locations: [https://chemcompute.org/gamess/submit](https://chemcompute.org/gamess/submit)
  - Ensure **control.inp** has the correct pp_path, bf_path, run_type=14, etc...
  - Change the name of the job in **job_script.sh**
  - Submit the job: **sbatch job_script.sh**
  - Check the job's status with "squeue -u <username>" or "qstat -a"
 

**Part 2 - TDDFT Proton and Molecule (No Temperature) Calculation** Varga Group Tutorials Part 2 - TDDFT Proton and Molecule (No Temperature) Calculation

[https://youtu.be/gTjWhoua7sI?si=UwlCIzlDoC4W3h6C](https://youtu.be/gTjWhoua7sI?si=UwlCIzlDoC4W3h6C)

- **Process Summary**: 
  - To assign the initial position of the proton, create a copy of the ground state directory and edit the new **dft.inp** file.
  - Within the **dft.inp** file, increment the number of atoms by 1 and add one more row for the **initial position (x,y,z)** and **atomic number** of the proton.
  - Create a directory for the set TDDFT job runs by copying an existing molecule's 'copy_runs' directory (e.g. C2H2_copy_runs) and naming it accordingly.
  - cd into the 'copy_runs directory'
  - Change the single run copy directory '<molecule-name>_copy' such that it corresponds to the molecule you are working with
    - In the **control.inp** file, have it access the gs_path for the ground state file including the proton
    - Also, update the "man_set_n_orbitals=" to the value of orbitals of the molecule not including the proton.
    - In the **job_script.sh** file change the job name
  - Now, this single run copy directory can be copied and then varied for every run in the set of TDDFT calculations you want to perform. This exists in the copyable set of TDDFT job runs directory, so this entire directory can be copied for everytime you want to run a set of simulations.
  - Copy the directory for the set of TDDFT job runs for your molecule and name it something corresponding to the sent of simulations you want to run.
  - cd into the newly copied directory. 
  - Copy the single run copy directory and give it a name corresponding to the run (e.g. C2H4_y_0.5 if you a have the proton colliding against C2H4 with a velocity of 0.5 A/fs along the y-axis)
  - cd into this directory, and create a **velocity.inp** file such that the first line in the file is the number of atoms and every subsequent lines is the velocity of each atom (A/fs) in the same order as in the **dft.inp** file.
  - In the **job_script.sh** file, change the job name
  - Submit the job: **sbatch job_script.sh**


**Part 3 - TDDFT Proton and Molecule (Temperature) Calculation** Varga Group Tutorials Part 3 - TDDFT Proton and Molecule Collisions (With Temperature)

[https://youtu.be/LehbPxC45uw?si=tNXneofiiCSGM2d9](https://youtu.be/LehbPxC45uw?si=tNXneofiiCSGM2d9)

- Uses the _Boltzmann_ program to initialize the velocity of each atom to the Boltzmann distribution.
- [https://github.com/samuelstaylor03/Boltzmann](https://github.com/samuelstaylor03/Boltzmann)
- **Process Summary**:
  - Copy the "copy_runs directory" (e.g. C2H4_copy_runs) for the set of TDDFT simulations for your molecule and name it something correspond to the set of TDDFT simulations.
  - cd into this copy_runs directory
  - Copy the single run copy directory (e.g. C2H4_copy) and name it accordingly for the simulation you will run.
  - Edit the control_boltzmann.inp file such that each variable is set as you would like for the simulation.
  - Run the boltzmann program: "./boltzmann <temperature in K> <seed>"
  - Make sure that the velocity.inp file is in the job directory that you would like to run.
  - Submit the job: **sbatch job_script.sh**


**Part 4 - Automating Job Submission for Boltzmann Distribution Based Atom Velocities with Random Seeds** Varga Group Tutorials Part 4 - Automating Job Submission: Boltzmann Atom Velocities w/ Random Seeds

[https://youtu.be/VawHuCNkmRY](https://youtu.be/VawHuCNkmRY)

- **Process Summary**: 
  - Copy the "copy_runs directory" (e.g. C2H4_copy_runs) for the set of TDDFT simulations for your molecule and name it something correspond to the set of TDDFT simulations.
  - cd into this copy_runs directory
  - Set the values of the **job_master.sh** file accordingly
  - Run the executable: **job_master.sh**
 

**Part 5 - Proton Initial Positions set According to a Grid to Collide with Molecule** Varga Group Tutorials Part 5 - Proton Initial Positions Grid Projectile into Molecule Simulations

[https://youtu.be/IyISJAwt4Mw?si=wvbsfQuoyZrWUwxU](https://youtu.be/IyISJAwt4Mw?si=wvbsfQuoyZrWUwxU)

- **Process Summary**:
  - Copy the "copy_runs directory" (e.g. C2H4_copy_runs) for the set of TDDFT simulations for your molecule and name it something correspond to the set of TDDFT simulations.
  - cd into this copy_runs directory
  - Import the **proton_projectile_grid.py** program.
  - Make a directory to store all of the ground state calculations.
  - Set the values in that program accordingly with the ground state calculations are performed in that new directory.
  - Run the program in ground state mode
  - Make sure that a **velocity.inp** is in the single run copy directory (this can be generated with the Boltzmann distribution). _This step was accidentally skipped in the video... see debugging in next video_
  - Once the DFT ground state calculation has finished, run the program in TDDFT mode

**Part 5a - Debugging Proton Projectile Grid** Varga Group Tutorials Part 5a - Debugging Proton Projectile Grid

[https://youtu.be/xoD4U0ApGZA?si=5ZCL3AuWXFWL0yum](https://youtu.be/xoD4U0ApGZA?si=5ZCL3AuWXFWL0yum)

 - **Process Summary**:
  - Read the monitor.out and error files to check for errors
  - Need to add velocity.inp to the single run copy directory before running the python program in TDDFT mode.
