# Varga-Group-Video-Tutorials
YouTube video tutorials for the Varga Group computational nanoscience.

**Video Playlist** This playlist consists of all the video tutorials for the group:

[https://youtube.com/playlist?list=PLlJvCT0DQtXvG7DHvCXf3cwxhCzBJ0mu1&si=DJteA9oKqwo4X2SI](url)

See descriptions for each video below:


**Part 1 - DFT Ground State Calculation** Varga Group Tutorials Part 1 - DFT Ground State Calculation

[https://youtu.be/LZXg4nj4XD4?si=W-lRHDyLUrkaKqPi](url)

- **Process Summary**: 
  - You need 3 files for the groundstate calculation: **control.inp, dft.inp, job_script.sh**
  - Edit the **dft.inp** file to ensure that the proper **number of atoms** for the molecule is correct as well as the **positions (x,y,z) of the atoms**.
    - Use the following link to get equilibrium geometry locations: [https://chemcompute.org/gamess/submit ](url)
  - Ensure **control.inp** has the correct pp_path and bf_path
  - Change the name of the job in **job_script.sh**
  - Submit the job: **sbatch job_script.sh**
