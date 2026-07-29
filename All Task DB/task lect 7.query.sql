

SELECT 
    first_name,
    last_name,
    department_id,
    salary
FROM employees
WHERE department_id IN

(
    -- Get departments located in UK
    SELECT department_id
    FROM departments
    WHERE location_id IN

    (
        -- Get locations in UK
        SELECT location_id
        FROM locations
        WHERE country_id =

        (
            -- Get country id of United Kingdom
            SELECT country_id
            FROM countries
            WHERE country_name = 'United Kingdom'
        )
    )
);



/*
Same Query using JOIN
*/


SELECT 
    e.first_name,
    e.last_name,
    e.department_id,
    e.salary
FROM employees e

JOIN departments d
ON e.department_id = d.department_id

JOIN locations l
ON d.location_id = l.location_id

JOIN countries c
ON l.country_id = c.country_id

WHERE c.country_name = 'United Kingdom';