# Exercise 4
This is an exercise for UFRJ's High Performance Computing class. It's goal was to convert a sequential program to parallel by implementing OpenMP instructions on it.

## Getting Started

1. Clone the repo:

   ```sh
   git clone https://github.com/carloshenriquefbf/HighPerformanceComputing.git
   ```
2. In order to run exercise 4 make sure you are on the right repository

   ```sh
   cd /HighPerformanceComputing/exercise4
   ```
3. Make the runner script executable

   ```sh
   chmod +x runner.sh
   ```
4. Run the script

    ```sh
   ./runner.sh
   ```
This WILL take some time. The script will generate the results on the documents folder.

The number of threads can be set on the runner.sh (the default is 6). If you are not sure the amount of threads your computer has, try running the command  ```lscpu```.
