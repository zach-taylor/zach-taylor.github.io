---
layout: post
title: NCDC 2014 Web Application
---

This is a follow-up post about the web application from ISU NCDC 2014. My code for the application is located on my Github account here.

Below I’ve included a report I submitted during the competition about the vulnerabilities and mitigations in the application.

In addition, I have a response time chart for our web server. I just thought it was kind of interesting to see.

These were the average response times for an HTTP GET request over time. The Y-axis is in milliseconds. The graph starts at 8:00 AM (when the competition started) and goes to around 3:00 PM.

#### Web App Vulnerabilities and Exploits

##### SQL Injection on Forms

I tested this vulnerability on my development server and can confirm that our login form is SQL injectable. Using the proof of concept (POC), I was able to drop the users table. One way we could prevent this would be to escape the input parameter so that special characters are not interpreted as part of the SQL syntax. In addition, we could have prevented the webapp database user from being able to DROP the tables in the database, though this would be less effective and still would allow for data deletion by deleting rows in the tables.

Since the login form is not the only form that is injectable, we would have to audit each individual database query in order to fix all accounts. I would estimate this fix to take two full-time engineers a few days to fix.

##### Reflected XSS
Since no parameters were checked in the timesheet functions, it safe to assume that our app is vulnerable to this attack. However, I was unable to reproduce the issues using provided POCs. We did set the X-XSS-Protection: 1; mode=block id header setting in our Apache configuration, which may have helped to prevent some XSS vulnerabilities.

It seems there is some information about escaping the output of user input here: [](https://www.owasp.org/index.php/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet#RULE_.231__HTML_Escape_Before_Inserting_Untrusted_Data_into_HTML_Element_Content)

There are less unchecked params than unescaped SQL queries, so I would estimate the mitigation for this would take one or two days for one full-time engineer.

##### Plaintext Database Password Entries
We noticed this issue in the application early on and were able to mitigate by hashing (w/ salt) our passwords before inputting them into the database. We did this by using the SHA() MySQL command. We also noticed that sensitive information such as the social security numbers of our employees was in the database. We were not able to mitigate this due to time, however MySQL has data encrypt and decrypt functions that could potentially facilitate this task.

To implement the MySQL functions and encrypt data in storage, it would not take very long to do. I would estimate that one full-time engineer could implement this functionality in one day.

##### Database Dump
We were not able to mitigate this issue. The debug code seemed fairly complex and obfuscated. To mitigate this one would need to trace the debug code and check it for “malware”.

In order to fix this issue, it would require removing the offending code. It would take a day to unravel the code, a day to patch/remove the code, and potentially another day to replace the code with its proper functionality.

##### Privilege Escalation
We did not mitigate this code. We did notice these lines, however, we forgot to fix it. We did make sure that the the app runs as the web-data user (Apache) and that sticky bits were not set during the deploy scripts.

It could potentially take a full-time engineer less than one day to fix this and implement it properly.

##### Known Session Identifiers
We fixed this issue by implementing session management in our application. For reference we used this cheat sheet: https://www.owasp.org/index.php/Session_Management_Cheat_Sheet

The session gets properly set in the user’s browser and has the HttpOnly and Secure options added to prevent tampering and hijack attempts.

##### Hidden Backdoor
We were unaware of this vulnerability and were unable to mitigate.

The POC would not work because we migrated our app to an entirely new OS.

To mitigate this issue it would require removing the offending code and two full-time engineers one or two days to patch it.

##### Buffer Overflows and Memory Leaks
Some of the functions the app are vulnerable to would be most of the string functions. Since many times string functions use the \0 (null) character to terminate, it can easy to miss this character or accidentally truncate it. This could potentially end up with a string of undefined length. The functions reach into memory until it finds a null character. Some of the string functions could be: sprintf, strcmp, strdup, etc. There are a class of ‘n’ string functions allow for specification of length which could prevent these issues.

We were unable to mitigate these issues, however, in almost all Linux OSs, memory not allocated to the application can not be read.

There were many string functions in this app and would require a few engineers multiple days to fix and verify the issues.


