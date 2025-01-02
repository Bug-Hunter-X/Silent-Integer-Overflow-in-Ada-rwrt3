# Silent Integer Overflow in Ada

This repository demonstrates a subtle bug in Ada related to integer overflow.  Ada's `Integer` type, unlike some other languages, does not inherently raise an exception or error when an integer value exceeds its defined range. Instead, it silently wraps around. This behavior can lead to hard-to-find bugs where calculations yield unexpected results.

The `bug.ada` file contains code that showcases this issue.  The `bugSolution.ada` file provides a solution to mitigate this using Ada's range constraints.

## How to Reproduce
1. Compile and run the code in `bug.ada`.  Note the unexpected result.
2. Examine the code in `bugSolution.ada` to see how to prevent this silent overflow.

##  Understanding the Problem
Ada's `Integer` type has a specific range (e.g., -2,147,483,648 to 2,147,483,647 on many systems). When an operation results in a value outside this range, Ada performs a modulo operation, effectively wrapping the value around.  This means that very large positive values become large negative values, and vice-versa.

This silent wrapping can be problematic because it doesn't trigger an error that might alert the programmer to a potential problem.  The program continues to run, but with incorrect results.

## Solution
The preferred solution is to use Ada's range constraints. By explicitly defining the allowed range for the integer variables, you force the compiler to enforce range checks and raise `Constraint_Error` if an out-of-range value occurs.

This makes the errors more easily detectable and allows for robust handling of potential integer overflows.