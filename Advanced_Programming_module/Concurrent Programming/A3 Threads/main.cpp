#include <iostream>
#include <vector>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <atomic>

std::vector<int> numbers;
std::mutex mtx;
std::condition_variable cv;
std::atomic<bool> running{true};

void addNumbers() {
    int count = 0;
    while (running) {
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
        {
            std::lock_guard<std::mutex> lock(mtx);
            numbers.push_back(count++);
            std::cout << "Added: " << count - 1 << "\n";
        }
        cv.notify_one(); // Notify the consumer that new data is available
    }
}

void removeNumbers() {
    while (running || !numbers.empty()) { // Ensure it processes remaining items before exiting
        std::unique_lock<std::mutex> lock(mtx);
        cv.wait(lock, [] { return !numbers.empty() || !running; }); // Wait until data is available

        if (!numbers.empty()) {
            std::cout << "Removed: " << numbers.front() << "\n";
            numbers.erase(numbers.begin());
        }
    }
}

int main() {
    std::thread producer(addNumbers);
    std::thread consumer(removeNumbers);

    std::this_thread::sleep_for(std::chrono::seconds(5)); // Let threads run for 5 seconds
    running = false; // Stop the producer

    cv.notify_all(); // Wake up the consumer so it can exit

    producer.join();
    consumer.join();

    std::cout << "Final vector size: " << numbers.size() << "\n";

    // Prevent the console from closing immediately
    std::cout << "Press Enter to exit the program...";
    std::cin.ignore(); // Ignore the leftover newline character from previous input
    std::cin.get();    // Wait for the user to press Enter

    return 0;
}
