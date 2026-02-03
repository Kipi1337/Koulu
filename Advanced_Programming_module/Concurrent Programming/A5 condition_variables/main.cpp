#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>

using namespace std;

mutex mtx;
condition_variable cv;
bool dataReady = false;

// Producer function
void producer() {
    this_thread::sleep_for(chrono::seconds(2)); // Simulate work
    
    // Lock mutex and update shared variable
    lock_guard<mutex> lock(mtx);
    dataReady = true;
    cout << "Producer: Data is ready!" << endl;
    
    // Notify consumer
    cv.notify_one();
}

// Consumer function
void consumer() {
    unique_lock<mutex> lock(mtx);
    
    // Wait for dataReady to become true
    cv.wait(lock, [] { return dataReady; });
    
    cout << "Consumer: Received data! Processing..." << endl;
}

int main() {
    thread t1(producer);
    thread t2(consumer);
    
    t1.join();
    t2.join();
    
    cout << "Main: All tasks completed!" << endl;
    
    // Prevent instant closure
    cout << "Press Enter to exit..." << endl;
    cin.get();
    
    return 0;
}
