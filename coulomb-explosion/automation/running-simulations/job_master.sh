#!/bin/bash

# Define variables
r_start=1
r_end=5
dir_name="C2H6_9_5r"
copy_dir="C2H6_copy"
seeds_file="seeds.txt"
job_file_name="job_script.sh"
control_file_name="control.inp"

# Function to copy directories and update files
copy_and_update() {
    r_start=$1
    r_end=$2
    dir_name=$3
    copy_dir=$4

    # Read seeds from the seeds.txt file
    seeds=($(cat $seeds_file))

    # Iterate to create the specified number of copies
    for (( r_val=r_start; r_val<=r_end; r_val++ )); do
        # New directory name
        new_dir="${dir_name}${r_val}"

        # Check if the directory already exists
        if [ -d "$new_dir" ]; then
            echo "Directory $new_dir already exists, skipping copy"
            return 1
        else
            # Copy the directory
            cp -r $copy_dir $new_dir
            echo "Copied $copy_dir to $new_dir"
        fi

        # Get the seed value for this directory
        seed=${seeds[$((r_val - 1))]}
        echo "Seed for $new_dir : $seed"

        # Path to the job.pbs and control.inp files in the new directory
        job_file_path="$new_dir/$job_file_name"
        control_file_path="$new_dir/$control_file_name"

        # Modify the job name line in the job.pbs file
        sed -i "s/^#SBATCH --job-name=.*/#SBATCH --job-name=${dir_name}${r_val}/" $job_file_path

        # Modify the ion_velocity_init_seed line in the control.inp file
        sed -i "s/^ion_velocity_init_seed=.*/ion_velocity_init_seed=${seed}/" $control_file_path
        
        # Remove the ^M characters from control.inp file
        sed -i 's/\r$//' $control_file_path

        echo "Updated job name in $job_file_path"
        echo "Updated ion_velocity_init_seed in $control_file_path"
    done

    echo "All directories copied and updated."
    return 0
}

# Function to submit jobs
submit_jobs() {
    r_start=$1
    r_end=$2
    dir_name=$3
    command="sbatch $job_file_name"

    # Iterate over each directory
    for (( r_val=r_start; r_val<=r_end; r_val++ )); do
        directory="${dir_name}${r_val}"

        # Check if the directory exists
        if [ -d "$directory" ]; then
            cd $directory
            echo "Changed to directory: $directory"

            # Execute the command
            result=$(qsub $job_file_name)

            # Check the result
            if [ $? -eq 0 ]; then
                echo "Successfully executed 'sbatch $job_file_name' in $directory"
            else
                echo "Failed to execute 'sbatch $job_file_name' in $directory with return code $?"
            fi

            # Change back to the original directory
            cd ..
            echo "Returned to parent directory"
        else
            echo "Directory $directory does not exist"
        fi
    done

    echo "Job submission process complete."
}

# Main execution starts here
# Call copy_and_update function
copy_and_update $r_start $r_end $dir_name $copy_dir
copy_update_status=$?

# Check if copy_and_update was successful
if [ $copy_update_status -eq 0 ]; then
    # Call submit_jobs function
    submit_jobs $r_start $r_end $dir_name
else
    echo "Failed because directories already existed"
fi

exit 0
