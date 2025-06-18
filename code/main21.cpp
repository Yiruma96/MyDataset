#include <iostream>

class Base {
public:
    virtual void foo() {
        std::cout << "Base::foo()" << std::endl;
        int x = 1;
        x = x + 2;
    }
    virtual ~Base() {
        std::cout << "Base::~Base()" << std::endl;
    }
};

class Derived : public Base {
public:
    void foo() override {
        std::cout << "Derived::foo()" << std::endl;
        int y = 3;
        y = y + 4;
    }
    ~Derived() {
        std::cout << "Derived::~Derived()" << std::endl;
    }
};

int main() {
    Base* ptr = new Derived();
    ptr->foo();
    delete ptr;
    return 0;
}