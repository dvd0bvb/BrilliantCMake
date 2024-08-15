/**
 * @file project.cpp
 * @author David Brill (6david6brill6@gmail.com)
 *
 * @copyright Copyright (c) 2024
 *
 * @brief Implements the fizz_buzz function
 */

#include "project/project.hpp"

#include <sstream>

namespace project {
  std::string fizz_buzz(int n) {
    std::stringstream ss;
    if (n % 3 == 0) {
      ss << "Fizz";
    }
    if (n % 5 == 0) {
      ss << "Buzz";
    }
    return ss.str();
  }
}  // namespace project
