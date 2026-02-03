Concept of std::future and std::promise

    std::future and std::promise help transfer values between threads without explicit locks.
    std::promise sets a value that will be available in the future.
    std::future retrieves this value when it is ready.

🔹 Working of std::future

    Internally stores a value to be assigned in the future.
    future::get() blocks execution until the value is available.

🔹 Working of std::promise

    Acts as a placeholder for a value that will be set later.
    Each std::promise has an associated std::future to retrieve the value once set.

🔹 Thread Communication with Future-Promise

    A thread can be assigned a task that produces a value for a std::promise.
    The main thread can wait for the result using std::future::wait_for() while performing other tasks.

🔹 Blocking and Exception Handling

    future::get() blocks the caller thread if the value is not yet set.
    If a std::promise is destroyed before setting a value, calling get() on its std::future will throw an exception.

🔹 Returning Multiple Values

    Multiple std::promise objects can be used to return multiple values at different times from a thread.s