#include <iostream>
#include <thread>
#include <mutex>
#include <random>

class BankAccount {
private:
    double balance;
    std::mutex mtx;

public:
    BankAccount(double initial_balance) : balance(initial_balance) {}

    // Deposit money
    void deposit(double amount) {
        std::lock_guard<std::mutex> lock(mtx);
        balance += amount;
        std::cout << "Deposited: $" << amount << ", New Balance: $" << balance << "\n";
    }

    // Withdraw money (only if balance allows)
    bool withdraw(double amount) {
        std::lock_guard<std::mutex> lock(mtx);
        if (balance >= amount) {
            balance -= amount;
            std::cout << "Withdrew: $" << amount << ", New Balance: $" << balance << "\n";
            return true;
        } else {
            std::cout << "Insufficient funds to withdraw $" << amount << "\n";
            return false;
        }
    }

    // Get balance
    double getBalance() {
        std::lock_guard<std::mutex> lock(mtx);
        return balance;
    }

    // Transfer money between accounts (avoiding deadlock)
    static void transfer(BankAccount &from, BankAccount &to, double amount) {
        std::scoped_lock lock(from.mtx, to.mtx); // Lock both mutexes safely

        if (from.balance >= amount) {
            from.balance -= amount;
            to.balance += amount;
            std::cout << "Transferred $" << amount << " from Account 1 to Account 2.\n";
        } else {
            std::cout << "Transfer failed due to insufficient funds.\n";
        }
    }
};

// Function for random transactions
void randomTransactions(BankAccount &acc1, BankAccount &acc2) {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> action(0, 2); // 0: deposit, 1: withdraw, 2: transfer
    std::uniform_int_distribution<int> amount(10, 100); // Random amount between $10 and $100

    for (int i = 0; i < 10; ++i) {
        int transactionType = action(gen);
        int transactionAmount = amount(gen);

        switch (transactionType) {
            case 0:
                acc1.deposit(transactionAmount);
                break;
            case 1:
                acc1.withdraw(transactionAmount);
                break;
            case 2:
                BankAccount::transfer(acc1, acc2, transactionAmount);
                break;
        }

        std::this_thread::sleep_for(std::chrono::milliseconds(100)); // Simulate delay
    }
}

int main() {
    // Create two bank accounts with initial balance
    BankAccount account1(1000);
    BankAccount account2(1000);

    // Start multiple threads to perform transactions
    std::thread t1(randomTransactions, std::ref(account1), std::ref(account2));
    std::thread t2(randomTransactions, std::ref(account2), std::ref(account1));
    std::thread t3(randomTransactions, std::ref(account1), std::ref(account2));
    std::thread t4(randomTransactions, std::ref(account2), std::ref(account1));

    t1.join();
    t2.join();
    t3.join();
    t4.join();

    // Verify final balances
    std::cout << "Final Balance of Account 1: $" << account1.getBalance() << "\n";
    std::cout << "Final Balance of Account 2: $" << account2.getBalance() << "\n";
    std::cout << "Total Money in System: $" << (account1.getBalance() + account2.getBalance()) << "\n";

    // Wait for Enter key before exiting
    std::cout << "Press Enter to exit the program...";
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); // Ignore any leftover input
    std::cin.get(); // Wait for Enter

    return 0;
}
