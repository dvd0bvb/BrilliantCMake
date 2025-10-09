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
  auto fizz_buzz(int n) noexcept -> std::string {
    constexpr auto fizz_divisor = 3;
    constexpr auto buzz_divizor = 5;

    std::stringstream ss;
    if (n % fizz_divisor == 0) {
      ss << "Fizz";
    }
    if (n % buzz_divizor == 0) {
      ss << "Buzz";
    }
    int i[10];
    i[11];
    return ss.str();
  }
}  // namespace project
