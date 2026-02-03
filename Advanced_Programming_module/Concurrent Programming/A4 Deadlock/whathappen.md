1. Understanding Deadlocks

    A deadlock occurs when multiple threads hold locks on different resources and wait indefinitely for each other to release them.
    It happens due to incorrect ordering of resource acquisition.

2. Causes of Deadlocks

    Circular waiting: Threads hold some locks while waiting for others held by different threads.
    Hold and wait: Threads acquire some resources and do not release them before requesting additional resources.
    No preemption: A locked resource cannot be forcibly taken from a thread.
    Mutual exclusion: A resource is locked such that only one thread can access it at a time.

3. Example: Simple Deadlock

The following code causes a deadlock because both threads attempt to lock the same mutex in an inconsistent order:

#include <iostream>
#include <thread>
#include <mutex>

std::mutex mutex1, mutex2;

void thread1() {
    std::cout << "Thread 1: Locking mutex1\n";
    mutex1.lock();
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    
    std::cout << "Thread 1: Locking mutex2\n";
    mutex2.lock();

    std::cout << "Thread 1: Critical section\n";
    mutex2.unlock();
    mutex1.unlock();
}

void thread2() {
    std::cout << "Thread 2: Locking mutex2\n";
    mutex2.lock();
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    
    std::cout << "Thread 2: Locking mutex1\n";
    mutex1.lock();

    std::cout << "Thread 2: Critical section\n";
    mutex1.unlock();
    mutex2.unlock();
}

int main() {
    std::thread t1(thread1);
    std::thread t2(thread2);

    t1.join();
    t2.join();

    std::cout << "Execution completed.\n";
    return 0;
}

    Problem: If thread1 locks mutex1 and thread2 locks mutex2, they will wait indefinitely.

4. Preventing Deadlocks

    Lock Mutexes in a Consistent Order
        Always lock resources in the same order across all threads.
    Use std::lock for Deadlock-Free Locking
        std::lock(mutex1, mutex2); ensures that both mutexes are locked without deadlock.
    Use std::try_lock to Avoid Waiting Indefinitely
        if (mutex1.try_lock() && mutex2.try_lock()) {} ensures threads proceed only if both mutexes are available.
    Limit Lock Scope
        Avoid holding locks while waiting for other resources.

5. Example: Fixing Deadlock Using std::lock

#include <iostream>
#include <thread>
#include <mutex>

std::mutex mutex1, mutex2;

void safeThread1() {
    std::lock(mutex1, mutex2); // Lock both mutexes safely
    std::lock_guard<std::mutex> lock1(mutex1, std::adopt_lock);
    std::lock_guard<std::mutex> lock2(mutex2, std::adopt_lock);

    std::cout << "Thread 1: Critical section\n";
}

void safeThread2() {
    std::lock(mutex1, mutex2); // Lock in the same order
    std::lock_guard<std::mutex> lock1(mutex1, std::adopt_lock);
    std::lock_guard<std::mutex> lock2(mutex2, std::adopt_lock);

    std::cout << "Thread 2: Critical section\n";
}

int main() {
    std::thread t1(safeThread1);
    std::thread t2(safeThread2);

    t1.join();
    t2.join();

    std::cout << "Execution completed.\n";
    return 0;
}

    Fixes:
        Uses std::lock() to avoid deadlocks.
        std::lock_guard with std::adopt_lock ensures proper lock management.

6. Key Takeaways

    Deadlocks are caused by inconsistent locking of shared resources.
    Avoid nested locks and always acquire mutexes in the same order.
    Use std::lock() for safe multi-mutex locking.
    Prefer std::try_lock() for non-blocking access to resources.