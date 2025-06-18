#include <iostream>

static void fun3() {}
static void fun4() {}
typedef void (*FuncPtr)();
static FuncPtr funcArray[] = {fun3, fun4};
static FuncPtr globalFuncPtr;

struct FuncStruct {
    FuncPtr funcPtr;
};

class Base {
public:
   virtual void fun1() {}
   virtual void fun2() {}
};
class Derived : public Base {
public:
   void fun1() override {}
   void fun2() override {}
};
int main(int value) {
   Base* base = new Derived();
   base->fun1();
   switch (value) {
       case 1: funcArray[0](); break;
       case 2: funcArray[0](); break;
   }
   FuncStruct* fs = (FuncStruct*)malloc(sizeof(FuncStruct));
   fs->funcPtr = fun3;
   return 0;
}

