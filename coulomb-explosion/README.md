# Varga-Group-Video-Tutorials

YouTube video tutorials for the Varga Group computational nanoscience.

**Video Playlist** This playlist consists of all the video tutorials for the group:

[https://youtube.com/playlist?list=PLlJvCT0DQtXtEYAiphyCyMYngGS5Olvf8&si=aD7E2Fxw1x-XgLOP](https://youtube.com/playlist?list=PLlJvCT0DQtXtEYAiphyCyMYngGS5Olvf8&si=aD7E2Fxw1x-XgLOP)

See descriptions for each video below:

**Part 0 (Preliminary) - TDDFT, code functionality, relevant theory** Part 0 - How the Code Works: Theory, TDDFT, Coulomb Explosion

[https://youtu.be/X59CCGhUo6c?si=E2uN6b9mBx6BlnK5](https://youtu.be/X59CCGhUo6c?si=E2uN6b9mBx6BlnK5)

See the slideshow PDF in this directory: [slides](coulomb-explosion\code-TDDFT.pdf).

Google Drive link: [https://docs.google.com/presentation/d/19HTjieT0qxCsgcAu84CfAV_ptTHfUIzl/edit?usp=sharing&ouid=115231511215616639438&rtpof=true&sd=true](https://docs.google.com/presentation/d/19HTjieT0qxCsgcAu84CfAV_ptTHfUIzl/edit?usp=sharing&ouid=115231511215616639438&rtpof=true&sd=true)

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

**Part 2 - TDDFT Molecule in E-field Calculation** Varga Group Tutorials Part 2 - TDDFT Molecule in E-field Calculation

[https://youtu.be/gTjWhoua7sI?si=UwlCIzlDoC4W3h6C](https://youtu.be/gTjWhoua7sI?si=UwlCIzlDoC4W3h6C)

- **Process Summary**:

  - You need 3 files for the TDDFT calculation: **control.inp, pulse.dat, job_script.sh**
  - NOTE: you can generate a pulse.dat file in the excel sheet provided in this GitHub.
  - Create a directory for the set TDDFT job runs by copying an existing molecule's 'copy_runs' directory (e.g. C2H2_copy_runs) and naming it accordingly.
  - cd into the 'copy_runs directory'
  - Change the single run copy directory '<molecule-name>\_copy' such that it corresponds to the molecule you are working with
    - In the **control.inp** file, have it access the gs_path for the ground state file including the proton
    - In the **job_script.sh** file change the job name
  - Now, this single run copy directory can be copied and then varied for every run in the set of TDDFT calculations you want to perform. This exists in the copyable set of TDDFT job runs directory, so this entire directory can be copied for everytime you want to run a set of simulations.
  - Copy the directory for the set of TDDFT job runs for your molecule and name it something corresponding to the sent of simulations you want to run.
  - cd into the newly copied directory.
  - Copy the single run copy directory and give it a name corresponding to the run (e.g. C2H6_7_00_r1 if you a have C2H6 in an E-field of 7 V/A where the value for the random seed is 1)
  - NOTE: you can copy the directory several times and set a different seed in **control.inp** for each calculation to vary the results.
  - In the **job_script.sh** file, change the job name
  - Submit the job: **sbatch job_script.sh**

**Part 4 - Automating Job Submission with Random Seeds** Varga Group Tutorials Part 4 - Automating Job Submission: Boltzmann Atom Velocities w/ Random Seeds

[https://youtu.be/VawHuCNkmRY](https://youtu.be/VawHuCNkmRY)

- **Process Summary**:
  - Copy the "copy_runs directory" (e.g. C2H4_copy_runs) for the set of TDDFT simulations for your molecule and name it something correspond to the set of TDDFT simulations.
  - cd into this copy_runs directory
  - Set the values of the **job_master.sh** file accordingly
  - Run the executable: **job_master.sh**

**Part 5 - Finale: Visualizing Output, Creating Figures, Writing Papers, General Advice** Varga Group Tutorials Part 5 - Proton Initial Positions Grid Projectile into Molecule Simulations

[https://youtu.be/IyISJAwt4Mw?si=wvbsfQuoyZrWUwxU](https://youtu.be/IyISJAwt4Mw?si=wvbsfQuoyZrWUwxU)

- **Process Summary**:
  - Several visualization scripts can be found here: https://github.com/samuelstaylor/TDDFT-output-and-scripts
  - Visualize outputs using visit: https://visit-dav.github.io/visit-website/
  - Advice:
  - Use AI (ChatGPT or Github Copilot to help write visualization scripts)
  - Biggest mistake that I see people make in this research group: running one simulation at a time.
  - Solution: do parameter sweeps!
  - For example, let's say I wanted to find the E-field intensity that fragments C4H10 without completely breaking it. Instead of running one simulation with an E-field of 5 V/A and one at 10 V/A to see if you are in the right range, do a parameter sweep. Do a simulation for several intermediate values until you get the results you are looking for. like 5 V/A, 5.5 V/A, 6 V/A, etc. Then when they all finish you will a lot of results to inspect.
  - You can start writing papers while jobs are running.
  - Write papers in overleaf. If you are no and have no idea where to start reference similar papers by Kalman and see how those are written/structured. Do not be afraid to ask Kalman or Cody for help or the LaTeX files they used for paper writing. They are there to help you: and by taking initiative you are helping them and the research group.
  - Have fun ツ-- learn the physics and don't just be a data analyst. Best resource is Kalman's textbook with the help of Chat to explain concepts that go over your head.
