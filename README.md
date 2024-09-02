# Varga-Group-Video-Tutorials
YouTube video tutorials for the Varga Group computational nanoscience.

**Video Playlist** This playlist consists of all the video tutorials for the group:

[https://youtube.com/playlist?list=PLlJvCT0DQtXvG7DHvCXf3cwxhCzBJ0mu1&si=DJteA9oKqwo4X2SI](url)

See descriptions for each video below:


**Part 1 - DFT Ground State Calculation** Varga Group Tutorials Part 1 - DFT Ground State Calculation

[https://youtu.be/LZXg4nj4XD4?si=W-lRHDyLUrkaKqPi](url)

- **Process Summary**: 
  - You need 3 files for the groundstate calculation: **control.inp, dft.inp, job_script.sh**
  - Edit the **dft.inp** file to ensure that the proper **number of atoms** for the molecule is correct as well as the **positions (x,y,z)** and **atomic numbers** of each of the atoms.
    - Use the following link to get equilibrium geometry locations: [https://chemcompute.org/gamess/submit ](url)
  - Ensure **control.inp** has the correct pp_path, bf_path, run_type=14, etc...
  - Change the name of the job in **job_script.sh**
  - Submit the job: **sbatch job_script.sh**
  - Check the job's status with "squeue -u <username>" or "qstat -a"
 

**Part 2 - TDDFT Proton and Molecule (No Temperature) Calculation** Varga Group Tutorials Part 2 - TDDFT Proton and Molecule (No Temperature) Calculation

[https://youtu.be/gTjWhoua7sI?si=UwlCIzlDoC4W3h6C](url)

- **Process Summary**: 
  - To assign the initial position of the proton, create a copy of the ground state directory and edit the new **dft.inp** file.
  - Within the **dft.inp** file, increment the number of atoms by 1 and add one more row for the **initial position (x,y,z)** and **atomic number** of the proton.
  - Create a directory for the TDDFT job runs. _copy an existing molecule's 'copy_runs' directory_
  - Change the single run copy directory '<molecule-name>_copy' such that it corresponds to the molecule you are working with
    - In the **control.inp** file, have it access the gs_path for the ground state file including the proton
    - Also, update the "man_set_n_orbitals=" to the value of orbitals of the molecule not including the proton.
    - In the **job_script.sh** file change the job name
  - Now, this single run copy directory can be copied and then varied for every run in the set of TDDFT calculations you want to perform.
  - Copy the single run copy directory and give it a name corresponding to the run (e.g. C2H4_y_0.5 if you a have the proton colliding against C2H4 with a velocity of 0.5 A/fs along the y-axis)
  - cd into this directory, and create a **velocity.inp** file such that the first line in the file is the number of atoms and every subsequent lines is the velocity of each atom (A/fs) in the same order as in the **dft.inp** file.
  - In the **job_script.sh** file, change the job name
  - Submit the job: **sbatch job_script.sh**

