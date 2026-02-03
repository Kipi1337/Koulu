#include <iostream>
#include <thread>
#include <vector>
#include <cstdlib>
#include <ctime>

// Use the standard namespace
using namespace std;

// Function to set array elements to random numbers
void fillArrayWithRandomNumbers(vector<int>& numbers) {
    // Seed for random number generation
    srand(static_cast<unsigned>(time(0)));
    for (auto& num : numbers) {
        num = rand() % 100; // Random number between 0 and 99
    }
}

int main() {
    int numElements;

    // Prompt the user until they enter a valid number
    while (true) {
        cout << "Enter the number of elements to allocate (must be above 0): ";
        cin >> numElements;

        if (cin.fail() || numElements <= 0) {
            cin.clear(); // Clear the error flag
            cin.ignore(numeric_limits<streamsize>::max(), '\n'); // Discard invalid input
            cout << "Invalid input. Please try again with a number above 0.\n";
        } else {
            break; // Valid input, exit the loop
        }
    }

    // Create an array (vector) of the specified size
    vector<int> numbers(numElements);

    // Create a thread to fill the array with random numbers
    thread worker(fillArrayWithRandomNumbers, ref(numbers));

    // Wait for the thread to finish
    if (worker.joinable()) {
        worker.join();
    }

    // Print the contents of the array
    cout << "Array contents: ";
    for (const auto& num : numbers) {
        cout << num << " ";
    }
    cout << "\n";

    // Prevent the console from closing immediately
    cout << "Press Enter to exit the program...";
    cin.ignore(); // Ignore the leftover newline character from previous input
    cin.get();    // Wait for the user to press Enter

    return 0;
}
