    Purpose of Condition Variables
        Used for signaling between threads in a synchronized manner.
        Allows one or more threads to wait for a condition to be met before proceeding.

    Mutex Requirement
        A mutex is required to work with a std::condition_variable.
        Ensures safe access to shared resources between threads.

    Waiting on a Condition
        std::condition_variable::wait releases the mutex and blocks the current thread until another thread signals it.
        Avoids busy-waiting, improving efficiency.
        Uses a predicate (lambda or function) to verify if the condition is actually met.

    Signaling a Condition Variable
        notify_one(): Wakes up one waiting thread.
        notify_all(): Wakes up all waiting threads.
        Used to indicate that an event (e.g., data loading) has completed.

    RAII (Resource Acquisition Is Initialization) Usage
        std::unique_lock<mutex> is used with wait() to automatically manage mutex locking and unlocking.
        std::lock_guard<mutex> ensures mutex unlocks when it goes out of scope.

    Example: File Upload Simulation
        Task 1: Connect to the server.
        Task 2: Load data from storage.
        Task 3: Upload data to the server (only after Task 1 & 2 complete).
        std::condition_variable ensures Task 3 waits for data to be loaded before proceeding.

    Avoiding Spurious Wakeups
        wait() should always check a condition inside a loop to prevent acting on unintended wakeups.

Final Thoughts 💡

Condition variables are powerful synchronization tools that help threads efficiently wait for events instead of continuously checking a condition. When used correctly with mutexes, they improve performance and prevent race conditions.