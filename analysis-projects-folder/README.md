# Pewlett Hackard Analysis

The purpose of this analysis project is to determine the number of retiring employees by title, and to identify which employees are eligible to to participate in the mentorship program in order to prepare management for the “silver tsunami” as many current employees reach retirement age.  The criterion was based on the birth dates ranging from 1952 to 1955 and hired dates from 1985 to 1988.

![download](https://user-images.githubusercontent.com/87709841/140666125-90c3719c-d328-475d-a03f-f45669f3ccef.jpg)

## Results

- After conducting the analysis it was found that a total of 72,458 employees are of retirement-age. There is currently a large number of employees of retirement age holding senior titles titles. 

- Senior Engineers make up 36% of the retiring. 

<img width="289" alt="Screen Shot 2021-11-07 at 5 27 34 PM" src="https://user-images.githubusercontent.com/87709841/140665900-cc3c7044-1296-4e9b-89ce-ad03ae8c18ab.png">

- With the retirment_titles table we are able to see every eligible for retirement employee and how long they have worked at each position over the course of their career.
<img width="452" alt="Screen Shot 2021-11-07 at 5 32 19 PM" src="https://user-images.githubusercontent.com/87709841/140666065-eb2f128a-f418-40f2-bf14-373ac2a5e775.png">

- The mentorship eligibility program shows that based on a birth year of 1965, there are 1549 employees eligible to participate in the mentorship program

<img width="726" alt="Screen Shot 2021-11-07 at 5 39 49 PM" src="https://user-images.githubusercontent.com/87709841/140666245-2adec298-5c68-4aa3-9027-19cffb8d8d28.png">

- 

## Summary

There will be many roles that will need to be filled as the "silver tsunami" makes its impact.  Given the current climate, however, while the numbers of the retirement-eligible employees is high, so also are those who are remaining at work for longer periods of time.  

Stratetically, however, the company should look at hiring practices and invest in engineering roles, replacing those senior level roles that do lead with current engineers, and increasing their mentorship program.

There might be considered enough enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees - 1549 is not a bad start.  However, using an updated query from the mentorship eligibility table:

```
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
--INTO mentorship_eligibilty
FROM employees as e
Left outer Join dept_emp as de
ON (e.emp_no = de.emp_no)
Left outer Join titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1964-01-01' AND '1965-12-31') AND de.to_date='9999-01-01' AND t.title LIKE '%Senior%'
ORDER BY e.emp_no;
```
if the mentorship birth year increased to include those born in 1964, and includes only those in a senior role, the total number of possible mentors increases by an estimatee 12453, increasing the likelihood of mentoring staff for the future.

