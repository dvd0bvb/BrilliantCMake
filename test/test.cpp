#include "gtest/gtest.h"
#include "project/project.hpp"

TEST(TestProject, TestFizzBuzz)
{
    EXPECT_EQ(project::fizz_buzz(3), "Fizz");
    EXPECT_EQ(project::fizz_buzz(5), "Buzz");
    EXPECT_EQ(project::fizz_buzz(15), "FizzBuzz");
    EXPECT_EQ(project::fizz_buzz(22), "");
}