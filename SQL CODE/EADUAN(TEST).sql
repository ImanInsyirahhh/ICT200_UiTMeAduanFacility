 /* SIMPLE QUERIES*/
/* 1.List all staff that are employed at the college. The result must be sorted by staffID descending.*/
SELECT *
FROM STAFF
ORDER BY STAFF_ID DESC;

/* 2.Display the complaint number, detail, and date of complaint which is the complaint number that starts with the letter ‘D’. */
SELECT COMPLAINT_NO, COMPLAINT_DETAIL, DOC
FROM COMPLAINT
WHERE COMPLAINT_NO LIKE 'D%';

/*MULTIPLE TABLE*/
/* 1.Display records of room and college for room ID that start with ‘SB’.*/
SELECT R.*, C.COLLEGE_NAME
FROM ROOM R
JOIN COLLEGE C ON R.COLLEGE_CODE = C.COLLEGE_CODE
WHERE R.ROOM_ID LIKE 'SB%';

/* 2.Retrieve the names of all students who have made complaints, along with the date of their complaints. */
SELECT S.STU_NAME, C.DOC
FROM STUDENT S
JOIN COMPLAINT C ON S.STU_ID = C.STU_ID;

/*COLUMN FUNCTIONS AND GROUPING*/
/* 1.Count the total number of complaints made by students in each college. */
SELECT C.COLLEGE_CODE, COUNT(*) AS TOTAL_COMPLAINTS
FROM COMPLAINT C
JOIN STUDENT S ON C.STU_ID = S.STU_ID
GROUP BY C.COLLEGE_CODE;

/* 2.Display the college code and which college has more than three complaints. Name the derived column as TOTAL_COMPLAINT. */
SELECT C.COLLEGE_CODE, COUNT(*) AS TOTAL_COMPLAINT
FROM COMPLAINT C
JOIN STUDENT S ON C.STU_ID = S.STU_ID
GROUP BY C.COLLEGE_CODE
HAVING COUNT(*) > 3;

/*SUBQUERIES*/
/* 1.List student's name and phone number along with the price of the room they assigned */
SELECT S.STU_NAME, S.STU_PHONE, R.ROOM_PRICE
FROM STUDENT S 
JOIN ROOM R ON S.ROOM_ID = R.ROOM_ID;

/* 2.List the complaint number, date of complaint and college code which not from TS. */
SELECT COMPLAINT_NO, DOC, COLLEGE_CODE
FROM COMPLAINT
WHERE COLLEGE_CODE <> 'TS';
  
  