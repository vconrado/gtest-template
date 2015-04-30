#include "Foo.hpp"

#include <stdio.h>

int main() {
    Foo foo;
    printf("One: %d\n", Foo::getOne());
    printf("Two: %d\n", foo.getTwo());
    return 0;
}

