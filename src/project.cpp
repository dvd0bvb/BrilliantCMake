#include <sstream>
#include "project/project.hpp"

namespace project
{
    std::string fizz_buzz(int n) 
    {
        std::stringstream ss;
        if (n % 3 == 0) 
        {
            ss << "Fizz";
        } 
        if (n % 5 == 0) 
        {
            ss << "Buzz";
        }
        return ss.str();
    }
} // namespace project
