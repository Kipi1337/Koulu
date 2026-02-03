Understanding std::async in Modern C++

    What is std::async?
        A function template that runs a callback (function, functor, or lambda) asynchronously.
        Returns a std::future, which stores the result of the executed function.
        Allows passing function arguments after the function pointer.

    Launch Policies in std::async
        std::launch::async: Runs the function in a separate thread.
        std::launch::deferred: Delays execution until .get() is called on the future.
        std::launch::async | std::launch::deferred (default): System decides whether to run asynchronously or deferred.

    Example Use Case
        Fetch data from a database and a file system, then merge the results.
        Initially, both functions run sequentially, taking a total of 10 seconds.
        Using std::async(std::launch::async, fetchDataFromDB, "Data123") allows them to run in parallel, reducing total execution time to ~5 seconds.

    Benefits of std::async
        Automatically manages thread creation and a std::promise for handling return values.
        Supports various callable types (functions, function objects, lambdas).
        Simplifies multithreading compared to std::thread.

    Async vs Deferred Execution
        std::launch::async: Starts a new thread immediately.
        std::launch::deferred: Delays execution until .get() is called.
        Default Behavior (async | deferred): System decides execution mode dynamically.

Conclusion

    std::async is a high-level threading tool that simplifies asynchronous programming.
    Using std::async with std::launch::async enables true parallel execution, reducing processing time.
    Default behavior (async | deferred) doesn't guarantee parallelism, making std::launch::async preferable for task-based concurrency.