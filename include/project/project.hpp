/**
 * @file project.hpp
 * @author David Brill (6david6brill6@gmail.com)
 *
 * @copyright Copyright (c) 2024
 *
 * @brief Declares the fizz_buzz function
 */

#include <string>

/**
 * @namespace project
 * @brief The project namespace
 */
namespace project {
  /**
   * @brief Output "Fizz" if input is divisible by 3, output "Buzz" if
   * input is divisible by 5, output "FizzBuzz" if it is divisible by
   * both 3 and 5. Output an empty string if input is divisible by neither.
   *
   * @param n The input integer
   * @return A string containing Fizz, Buzz, FizzBuzz or nothing
   */
  [[nodiscard]] auto fizz_buzz(int n) noexcept -> std::string;
}  // namespace project
