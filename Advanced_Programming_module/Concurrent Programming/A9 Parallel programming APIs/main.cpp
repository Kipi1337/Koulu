#include <iostream>
#include <queue>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>

using namespace std;
using namespace chrono;

const int NUM_PASSENGERS = 4;
const int SCAN_TIME = 1;    // 1 minute
const int SECURITY_TIME = 10; // 10 minutes

queue<int> securityQueue;
mutex mtx;
condition_variable cv;

void scanBoardingPass(int id) {
    this_thread::sleep_for(seconds(SCAN_TIME));
    cout << "Passenger " << id << " scanned boarding pass.\n";
    {
        lock_guard<mutex> lock(mtx);
        securityQueue.push(id);
    }
    cv.notify_one();
}

void securityCheck(int securityLines) {
    while (true) {
        unique_lock<mutex> lock(mtx);
        cv.wait(lock, [] { return !securityQueue.empty(); });

        int id = securityQueue.front();
        securityQueue.pop();
        lock.unlock();

        cout << "Passenger " << id << " entering security check...\n";
        this_thread::sleep_for(seconds(SECURITY_TIME / securityLines)); // Parallel processing
        cout << "Passenger " << id << " cleared security.\n";

        if (id == NUM_PASSENGERS) break; // Exit after last passenger
    }
}

void simulateAirport(int securityLines) {
    cout << "\n--- Simulation with " << securityLines << " Security Line(s) ---\n";

    queue<int> emptyQueue;
    swap(securityQueue, emptyQueue); // Reset queue

    thread securityThread(securityCheck, securityLines);
    vector<thread> passengers;

    for (int i = 1; i <= NUM_PASSENGERS; ++i) {
        passengers.push_back(thread(scanBoardingPass, i));
        this_thread::sleep_for(seconds(SCAN_TIME)); // Next passenger arrives 1 min later
    }

    for (auto& t : passengers) t.join();
    securityThread.join();

    cout << "Simulation completed.\n";
}

int main() {
    simulateAirport(1); // 1 security line
    simulateAirport(2); // 2 security lines
    simulateAirport(4); // 4 security lines

    cout << "\nPress Enter to exit...\n";
    cin.get();
    return 0;
}
