-- LeetCode 595: Big Countries
-- https://leetcode.com/problems/big-countries/
-- Difficulty: Easy · Dialect: MySQL
-- Table: World (name, continent, area, population, gdp)
-- Approach: A country is big if either condition holds, so combine them with OR.

SELECT name, population, area
FROM World
WHERE area >= 3000000          -- 3 million km²
   OR population >= 25000000;  -- 25 million
