#include <limits.h>
#include "gtest/gtest.h"
#include "Foo.hpp"

class FooTest : public ::testing::Test {
protected:
    virtual void SetUp() { }
    
    virtual void TearDown() {
    // Code here will be called immediately after each test
    // (right before the destructor).
    }
};

TEST_F(FooTest,oneTest){
    Foo foo;
    EXPECT_EQ(1,foo.getOne());
}

TEST_F(FooTest,twoTest){
    Foo foo;
    EXPECT_EQ(2,foo.getTwo());
}
