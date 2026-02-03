#include <iostream>
#include <thread>
#include <vector>
#include <mutex>

void threadFunction(int threadId, std::mutex& printMutex) {
    for (int i = 1; i < 1001; ++i) {
        std::lock_guard<std::mutex> lock(printMutex);
        std::cout << "Thread " << threadId << " iteration: " << i << std::endl;
    }
}

int main() {
    // Detect the number of logical processors
    unsigned int numThreads = std::thread::hardware_concurrency();
    if (numThreads == 0) {
        std::cerr << "Failed to detect logical processors. Defaulting to 1 thread." << std::endl;
        numThreads = 1;
    }

    std::cout << "Detected " << numThreads << " logical processors." << std::endl;

    // Create a vector to store threads
    std::vector<std::thread> threads;

    // Mutex for synchronized printing
    std::mutex printMutex;

    // Launch threads
    for (unsigned int i = 0; i < numThreads; ++i) {
        threads.emplace_back(threadFunction, i, std::ref(printMutex));
    }

    // Wait for all threads to finish
    for (auto& thread : threads) {
        if (thread.joinable()) {
            thread.join();
        }
    }

    std::cout << "All threads have finished." << std::endl;

    // Wait for user input before closing
    std::cout << "Press Enter to exit...";
    std::cin.get();

    return 0;
}