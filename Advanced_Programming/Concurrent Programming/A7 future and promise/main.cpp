#include <iostream>
#include <vector>
#include <thread>
#include <future>
#include <random>
#include <chrono>
#include <mutex>

using namespace std;

const int NUM_SENSORS = 5;
const int THRESHOLD = 75;

// Mutex for synchronizing console output
mutex cout_mutex;

void sensorFunction(promise<int> &&pro, int sensorID)
{
    try {
        random_device rd;
        mt19937 gen(rd());
        uniform_int_distribution<int> dist(50, 100);
        
        // Simulate sensor reading
        int reading = dist(gen);
        this_thread::sleep_for(chrono::milliseconds(500));
        
        // Lock cout to ensure only one thread prints at a time
        lock_guard<mutex> lock(cout_mutex);
        cout << "Sensor " << sensorID << " reading: " << reading << "\n";
        pro.set_value(reading); // Set value to promise
    } catch (const exception& e) {
        cerr << "Exception in sensor " << sensorID << ": " << e.what() << endl;
        pro.set_exception(make_exception_ptr(e)); // Handle exception
    }
}

void processingFunction(vector<future<int>> &futures)
{
    for (size_t i = 0; i < futures.size(); ++i)
    {
        try {
            int reading = futures[i].get();  // Get the reading from the future
            
            // Lock cout to ensure only one thread prints at a time
            lock_guard<mutex> lock(cout_mutex);
            
            if (reading > THRESHOLD)
            {
                cout << "ALERT: Sensor " << i + 1 << " exceeded threshold with value: " << reading << "\n";
            }
            else
            {
                cout << "Sensor " << i + 1 << " reading is normal: " << reading << "\n";
            }
        } catch (const exception& e) {
            cerr << "Error retrieving data for sensor " << i + 1 << ": " << e.what() << endl;
        }
    }
}

int main()
{
    vector<thread> sensorThreads;
    vector<promise<int>> promises(NUM_SENSORS);
    vector<future<int>> futures;

    // Create sensor threads
    for (int i = 0; i < NUM_SENSORS; ++i)
    {
        futures.push_back(promises[i].get_future());
        sensorThreads.emplace_back(sensorFunction, move(promises[i]), i + 1);
    }

    // Start processing function
    thread processor(processingFunction, ref(futures));

    // Join sensor threads
    for (auto &t : sensorThreads)
    {
        t.join();
    }

    // Join processor thread
    processor.join();

    // Prevent immediate closing of the program
    cout << "Press Enter to exit..." << endl;
    cin.get();  // Wait for user input before closing

    return 0;
}
