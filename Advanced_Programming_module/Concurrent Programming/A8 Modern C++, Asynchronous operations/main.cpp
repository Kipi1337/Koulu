#include <iostream>
#include <chrono>
#include <future>

using namespace std;
using namespace std::chrono;

// Function to compute Fibonacci (inefficient recursive approach)
long long fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main() {
    const int fibNumber = 40; // Computationally intensive value

    // Async execution with std::launch::async
    auto asyncStart = high_resolution_clock::now();
    future<long long> asyncResult = async(launch::async, fibonacci, fibNumber);
    long long resultAsync = asyncResult.get();
    auto asyncEnd = high_resolution_clock::now();
    auto asyncTime = duration_cast<milliseconds>(asyncEnd - asyncStart).count();
    cout << "Async Result: " << resultAsync << " | Time Taken: " << asyncTime << " ms\n";

    // Deferred execution with std::launch::deferred
    auto deferredStart = high_resolution_clock::now();
    future<long long> deferredResult = async(launch::deferred, fibonacci, fibNumber);
    long long resultDeferred = deferredResult.get();  // This triggers execution
    auto deferredEnd = high_resolution_clock::now();
    auto deferredTime = duration_cast<milliseconds>(deferredEnd - deferredStart).count();
    cout << "Deferred Result: " << resultDeferred << " | Time Taken: " << deferredTime << " ms\n";

    /*
    Analysis:

    1. `std::launch::async` starts execution immediately in a separate thread, allowing other tasks to run concurrently.
    2. `std::launch::deferred` delays execution until `.get()` is called, meaning it runs in the same thread as the caller.
    3. Performance difference:
       - If the system has multiple CPU cores, `std::launch::async` is generally faster since it executes in parallel.
       - `std::launch::deferred` behaves like a normal function call, making it useful when concurrency isn't needed.
    4. Best Use Cases:
       - Use `std::launch::async` when parallel execution improves performance (e.g., multi-threaded computation).
       - Use `std::launch::deferred` for lazy evaluation (e.g., when execution is only needed based on a condition).
    */

    cout << "\nPress Enter to exit...";
    cin.get();

    return 0;
}
