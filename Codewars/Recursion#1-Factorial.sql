--This is a kata series that you can only solve using recursion.
-- ##1 - Factorial

-- #In mathematics, the factorial of a non-negative integer n, denoted by n!, is the product of all positive integers less than or equal to n. For example,

-- #5! = 5 * 4 * 3 * 2 * 1 = 120.

-- ### The value of 0! is 1.

-- #Your task

--### You have to create the function factorial that receives n and returns n!. You have to use recursion.



WITH RECURSIVE factorial(n, fact)             -- Declare Recurisve Query with n and fact as outputs
AS (                                            
  SELECT                                      -- Initial Query that sets everything up
    0 AS n,                                   -- 0 as n = starting index
    1::NUMERIC(22,6) AS fact                  -- Configure 1 as the starting factorial and set as numeric type (0 factorial == 1)
  UNION ALL                                   -- UNION ALL subqueries to the final result
  SELECT
    n + 1 AS n,                               -- Increment index n by one each run through
    (fact * (n + 1))::NUMERIC(22,6) AS fact   -- Calculate factorial of n utilizing the previous calculated factorial
  FROM
    factorial                                 -- Continue the Recursion
  WHERE n < 16                                -- Stop the Recursion when index n is greater than 16
)

SELECT                                        -- Call the factorial recursive function
  n,
  fact
FROM
  factorial
SELECT n, factorial(n) fact FROM generate_series(0,16) AS numbers(n);
