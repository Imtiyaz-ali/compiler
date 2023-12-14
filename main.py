import os

# Specify the base directory where you want to create subdirectories
base_directory = "assets/"

# Create 10 directories using a for loop
for i in range(4, 14):
    directory_name = f"exp{i}"
    directory_path = os.path.join(base_directory, directory_name)

    # Check if the directory already exists
    if not os.path.exists(directory_path):
        os.makedirs(directory_path)
        print(f"Directory '{directory_name}' created at '{directory_path}'")
    else:
        print(f"Directory '{directory_name}' already exists at '{directory_path}'")
