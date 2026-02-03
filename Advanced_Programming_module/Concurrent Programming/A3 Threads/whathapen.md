Shared Vector & Mutex: std::vector<int> numbers; is the shared resource, and std::mutex mtx; ensures thread-safe access.
Producer Thread: Adds numbers to the vector every 100 milliseconds.
Consumer Thread: Removes numbers from the vector every 150 milliseconds.
Synchronization: std::lock_guard<std::mutex> ensures mutual exclusion.
Graceful Termination: The main thread stops execution after 5 seconds and joins both threads.

1. Importance of Concurrency

    Concurrency is crucial for fully utilizing multicore processors.
    It enables faster execution but introduces complex debugging challenges.
    Sharing resources across threads can lead to unpredictable behavior.

2. Race Condition

    Occurs when multiple threads access shared data without proper synchronization.
    Leads to unpredictable and incorrect results.
    Example: Incrementing a shared counter in multiple threads without protection.

3. Synchronization Methods

To avoid race conditions, synchronization is required:

    Mutex (Mutual Exclusion)
        Ensures only one thread accesses a critical section at a time.
        std::mutex in C++ provides lock/unlock mechanisms.

    Atomic References (std::atomic)
        Ensures operations on variables are performed atomically without explicit locking.

    Condition Variables (std::condition_variable)
        Helps threads coordinate execution by waiting and notifying conditions.

    Semaphores (Limited Use in C++)
        Controls access to resources by allowing only a specific number of threads.

    Monitors (Not supported in C++)
        Provides built-in synchronization to restrict concurrent access.

    Compare-and-Swap (CAS)
        Ensures safe updates to shared memory locations by checking previous values before modifying.

4. Mutex Example for Synchronization

Using std::mutex to prevent race conditions:

#include <iostream>
#include <thread>
#include <mutex>

class DataContainer {
public:
    DataContainer() : number(0) {}

    void increment(int count) {
        while (count--) {
            std::lock_guard<std::mutex> lock(mtx);
            ++number;
        }
    }

    int number;
private:
    std::mutex mtx;
};

int main() {
    DataContainer data;

    std::thread t1(&DataContainer::increment, &data, 10000);
    std::thread t2(&DataContainer::increment, &data, 10000);

    t1.join();
    t2.join();

    std::cout << "Final result: " << data.number << "\n";
    return 0;
}

    std::lock_guard<std::mutex> ensures safe access without manual lock/unlock.
    Prevents race conditions by allowing only one thread to modify number at a time.

5. Key Takeaways

    Use mutex for critical sections to avoid race conditions.
    Atomic variables are useful for lightweight synchronization.
    Condition variables help coordinate multi-threaded operations.
    Concurrency introduces challenges, but proper synchronization ensures correctness.