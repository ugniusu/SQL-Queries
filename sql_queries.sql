--  Query for JOB1: Return most recent active row of employee 102030

SELECT *
FROM JOB
WHERE Employee_ID = 102030
  AND Employment_Status = 'Active'
ORDER BY Effective_Date DESC, Effective_Sequence DESC
LIMIT 1;

--------------------------------------------------------------------
-- Query for JOB2: Selects the latest active job entries for each employee.
-- Each employee can have multiple active job records (EMPL_RCD).
-- Filters only active statuses and outputs the following columns: EMPLID, EMPL_RCD, EFFDT, COMPANY, Birthdate, Age in years, Gender ('Male'/'Female'), and Preferred Phone number.

SELECT
    j.EMPLID,
    j.EMP_RCD,
    j.EFFDT,
    j.COMPANY,
    pd.Birthdate,
    TIMESTAMPDIFF(YEAR, pd.Birthdate, CURDATE()) AS Age,
    CASE 
        WHEN pd.Gender = 'F' THEN 'Female'
        WHEN pd.Gender = 'M' THEN 'Male'
        ELSE 'Unknown'
    END AS Gender,
    pp.Phone AS Preferred_Phone
FROM
    job j
    INNER JOIN (
        SELECT 
            EMPLID,
            EMP_RCD,
            MAX(EFFDT) AS Max_EFFDT
        FROM 
            job
        WHERE
            HR_STATUS = 'Active'
        GROUP BY 
            EMPLID, EMP_RCD
    ) latest 
    ON j.EMPLID = latest.EMPLID AND j.EMP_RCD = latest.EMP_RCD AND j.EFFDT = latest.Max_EFFDT

    INNER JOIN personal_data pd ON j.EMPLID = pd.EMPLID

    INNER JOIN personal_phone pp ON j.EMPLID = pp.EMPLID AND pp.Preferred = 'Y'

WHERE
    j.HR_STATUS = 'Active'
ORDER BY
    j.EMPLID, j.EMP_RCD;


------------------------------------------------------------
-- Query for JOB2 Part 2. Select emplid and all records employee has/had in one column from JOB table

SELECT 
    EMPLID,
    GROUP_CONCAT(DISTINCT EMP_RCD ORDER BY EMP_RCD ASC SEPARATOR ',') AS RECORDS
FROM JOB
WHERE EMP_RCD > 0 
   OR EMPLID NOT IN (
       SELECT EMPLID FROM JOB WHERE EMP_RCD > 0
   )
GROUP BY EMPLID;