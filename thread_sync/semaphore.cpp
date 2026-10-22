#include <semaphore>
#include <chrono>
#include <iostream>
#include <string>
#include <thread>
#include <vector>

long a = 0;
std::binary_semaphore sem(1);

void worker(long m) {
    for (long i = 0; i < m; ++i) {
        sem.acquire();
        ++a;
        sem.release();
    }
}

int main(int argc, char* argv[]) {
    if (argc != 3) {
        std::cerr << "Usage: " << argv[0] << " N M\n";
        return 1;
    }

    int n = std::stoi(argv[1]);
    long m = std::stol(argv[2]);

    auto start = std::chrono::steady_clock::now();

    std::vector<std::thread> threads;
    for (long i = 0; i < n; ++i) {
        threads.emplace_back(worker, m);
    }
    for (auto& t : threads) {
        t.join();
    }

    auto end = std::chrono::steady_clock::now();

    double ms = std::chrono::duration<double, std::milli>(end - start).count();

    std::cout << "a = " << a << '\n';
    std::cout << "expected = " << n * m << '\n';
    std::cout << "ms = " << ms << '\n';
}
