#include <iostream>
#include <thread>
#include <atomic>
#include <random>
#include <vector>

class BankAccount {
private:
    std::atomic<double> balance;
    std::atomic<int> transactionCount;

public:
    BankAccount(double initial_balance) : balance(initial_balance), transactionCount(0) {}

    void deposit(double amount) {
        double current = balance.load();
        while (!balance.compare_exchange_weak(current, current + amount)) {}
        std::cout << "Deposited: $" << amount << ", New Balance: $" << balance.load() << "\n";
        checkInterest();
    }

    bool withdraw(double amount) {
        double current = balance.load();
        while (current >= amount && !balance.compare_exchange_weak(current, current - amount)) {}
        if (current < amount) {
            std::cout << "Insufficient funds to withdraw $" << amount << "\n";
            return false;
        }
        std::cout << "Withdrew: $" << amount << ", New Balance: $" << balance.load() << "\n";
        checkInterest();
        return true;
    }

    double getBalance() {
        return balance.load();
    }

    void addInterest() {
        double current = balance.load();
        double newBalance;
        do {
            newBalance = current * 1.0005; // Add 0.05% interest
        } while (!balance.compare_exchange_weak(current, newBalance));
        std::cout << "Interest added, New Balance: $" << newBalance << "\n";
    }

    void checkInterest() {
        if (++transactionCount % 100 == 0) {
            addInterest();
        }
    }
};

void randomTransactions(BankAccount &acc1, BankAccount &acc2) {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> action(0, 1); // 0: deposit, 1: withdraw
    std::uniform_int_distribution<int> amount(10, 100);

    for (int i = 0; i < 100; ++i) {
        int transactionType = action(gen);
        int transactionAmount = amount(gen);

        if (transactionType == 0) {
            acc1.deposit(transactionAmount);
        } else {
            acc1.withdraw(transactionAmount);
        }
    }
}

int main() {
    BankAccount account1(1000);
    BankAccount account2(1000);

    std::vector<std::thread> threads;
    for (int i = 0; i < 4; ++i) {
        threads.emplace_back(randomTransactions, std::ref(account1), std::ref(account2));
    }

    for (auto &t : threads) {
        t.join();
    }

    std::cout << "Final Balance of Account 1: $" << account1.getBalance() << "\n";
    std::cout << "Final Balance of Account 2: $" << account2.getBalance() << "\n";

    std::cout << "Press Enter to exit..." << std::endl;
    std::cin.get();
    
    return 0;
}
