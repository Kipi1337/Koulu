1. Data Race & Synchronization

    A data race occurs when multiple threads concurrently modify the same memory location without synchronization.
    Mutexes (std::mutex) can synchronize access but introduce performance overhead.

2. Introduction to std::atomic<>

    Atomic operations are thread-safe and prevent undefined behavior without explicit locking.
    std::atomic<> ensures operations are completed in a single step, avoiding race conditions.

3. Mutex vs. Lock-Free Performance
Synchronization Method	Execution Time (ms)	Notes
Mutex (std::mutex)	2750ms	Safe, but slow due to thread blocking
Atomic (std::atomic<>)	670ms	Faster, lock-free when applicable
No Synchronization	339ms	Fastest, but incorrect due to race conditions
4. Limitations of Atomics

    No atomic multiplication or division (n *= 2; is not atomic).
    Only trivial types (like int, double, bool) are fully atomic.
    Larger objects (structs, classes) may still require locks.

5. Useful Atomic Operations

    Read & Write: load(), store()
    Increment & Decrement: fetch_add(), fetch_sub()
    Compare-and-Swap (CAS): compare_exchange_strong()
        Useful for lock-free algorithms.

6. When to Use Atomics?

    Use mutexes when modifying complex shared resources.
    Use atomics for simple counters or flags for better performance.