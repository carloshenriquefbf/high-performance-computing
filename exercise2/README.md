# Exercise 2
This is an exercise for UFRJ's High Performance Computing class. It's goal was to use gprof to analyze hotspots on a given C++ code file and to use good programming practices to solve such hotspots. The given C++ code file is a Gauss-Siedel Laplacian solver and the exercise requires a n x n matrix with n = 500, 100 iterations and 10<sup>⁻16</sup> as precision.

## Getting Started

1. Clone the repo:

   ```sh
   git clone https://github.com/carloshenriquefbf/HighPerformanceComputing.git
   ```
2. In order to run exercise 2 make sure you are on the right repository

   ```sh
   cd /HighPerformanceComputing/exercise2
   ```
3. Make the runner script executable

   ```sh
   chmod +x runner.sh
   ```
4. Run the script

    ```sh
   ./runner.sh
   ```
The script will generate the reports for each file with the exercise requirements (nx = 500, ny = 500, n_iter = 100, eps = 1e-16). You can check the generated files on the reports folder.