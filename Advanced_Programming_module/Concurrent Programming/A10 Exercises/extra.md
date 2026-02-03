Parallelizing addPixelColors with OpenMP

To improve performance, we can parallelize the addPixelColors function using OpenMP. The loop iterating over imageSize can be processed in parallel since each pixel is updated independently.
Steps:

    Use OpenMP: Add #pragma omp parallel for to distribute the loop iterations across multiple threads.
    Enable OpenMP in Compilation: If using GCC, compile with -fopenmp.
    
    Expected Performance Improvement:

    OpenMP will divide the loop iterations among available CPU cores.
    Speedup will depend on the number of cores and system overhead.
    Expect significant improvement on multi-core CPUs.

Compilation (GCC):

g++ -fopenmp -O2 image_processing.cpp -o image_processing

This ensures OpenMP is enabled and optimizations are applied.