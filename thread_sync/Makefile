all: variable_O0 variable_O2 increment_O0 increment_O2 mutex_O0 mutex_O2 atomic_O0 atomic_O2 semaphore_O0 semaphore_O2

variable_O0: variable.cpp
	c++ -std=c++20 -pthread -O0 variable.cpp -o variable_O0

variable_O2: variable.cpp
	c++ -std=c++20 -pthread -O2 variable.cpp -o variable_O2

increment_O0: increment.cpp
	c++ -std=c++20 -pthread -O0 increment.cpp -o increment_O0

increment_O2: increment.cpp
	c++ -std=c++20 -pthread -O2 increment.cpp -o increment_O2

mutex_O0: mutex.cpp
	c++ -std=c++20 -pthread -O0 mutex.cpp -o mutex_O0

mutex_O2: mutex.cpp
	c++ -std=c++20 -pthread -O2 mutex.cpp -o mutex_O2

atomic_O0: atomic.cpp
	c++ -std=c++20 -pthread -O0 atomic.cpp -o atomic_O0

atomic_O2: atomic.cpp
	c++ -std=c++20 -pthread -O2 atomic.cpp -o atomic_O2

semaphore_O0: semaphore.cpp
	c++ -std=c++20 -pthread -O0 semaphore.cpp -o semaphore_O0

semaphore_O2: semaphore.cpp
	c++ -std=c++20 -pthread -O2 semaphore.cpp -o semaphore_O2

.PHONY: all
