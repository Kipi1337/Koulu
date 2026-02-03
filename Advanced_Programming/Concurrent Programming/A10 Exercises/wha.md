1. Rust and Data Races

Rust eliminates data races through its ownership system, enforced at compile-time using borrow checking. The key principles are:

    Ownership: Each value has a single owner at a time.
    Borrowing & Mutability Rules:
        A variable can be either borrowed mutably or multiple times immutably, but not both at the same time.
    Safe Concurrency: Rust’s type system ensures that data cannot be accessed simultaneously in an unsafe way by different threads.

These rules prevent race conditions where multiple threads try to read/write shared memory without proper synchronization.
2. Evaluating (ab+cd2)(g+fh)(ab+cd2)(g+fh) Sequentially

Breaking the expression into four steps:

    X=ab+cd2X=ab+cd2
    Y=g+fhY=g+fh
    Z=X×YZ=X×Y
    Return ZZ

Diagram:

Step 1:   ab  +  cd²  →  X
Step 2:   g  +  fh     →  Y
Step 3:   X  *  Y      →  Z
Step 4:   Return Z

Each step depends on the previous results, making it inherently sequential.
3. Quicksort in Concurrent Parts

Quicksort is naturally parallelizable because:

    It recursively partitions the array into smaller subarrays.
    Each partition can be sorted independently in parallel.

Steps to make Quicksort concurrent:

    Choose a pivot and partition the array into left (smaller) and right (larger) subarrays.
    Spawn two threads to sort each subarray concurrently.
    Once both subarrays are sorted, combine the results.

In languages like C++ (with std::async) or Rust (with std::thread), each partition can run in parallel until the subarrays are small enough for sequential sorting.
4. Threads vs. Event-Based Systems

(Referring to "The Case of Threads vs. Events" article)

Key takeaways:

    Thread-based systems:
        Easier to write (resemble sequential execution).
        Each thread runs independently but may have synchronization issues (locks, race conditions).
    Event-based systems:
        Use non-blocking I/O with an event loop.
        More efficient in handling many connections (e.g., web servers).
        Harder to write due to callback-style programming.

Conclusion:
Threads are useful for CPU-bound tasks, while event-based systems excel in I/O-heavy workloads like web servers.
5. Spawning a Process with execve and fork (Unix)

To create a new process in Unix:

    fork() creates a child process.
    execve() replaces the child process image with a new program.

Example in C:

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    pid_t pid = fork(); // Create child process

    if (pid == 0) { // Child process
        char *args[] = {"/bin/ls", "-l", NULL};
        execve("/bin/ls", args, NULL); // Replace child process with `ls -l`
        perror("execve failed"); // This runs only if execve fails
    } else { // Parent process
        wait(NULL); // Wait for child to finish
        printf("Child process finished.\n");
    }

    return 0;
}

    fork() creates a new process.
    execve() replaces it with a new program (ls -l).
    wait() ensures the parent waits for the child to finish.

6. Win32 Thread States

Windows threads have six states:

    Initialized – Thread is created but hasn't started running.
    Ready – Thread is ready to run but waiting for CPU time.
    Running – Thread is executing on the processor.
    Waiting – Thread is paused, waiting for an event or resource.
    Terminated – Thread has finished execution.
    Transition – Thread is not yet ready to run (e.g., waiting for memory).

Why are they necessary?

    They optimize scheduling so threads don't waste CPU cycles.
    Prevent deadlocks by managing dependencies.
    Improve system efficiency by ensuring the right thread runs at the right time.