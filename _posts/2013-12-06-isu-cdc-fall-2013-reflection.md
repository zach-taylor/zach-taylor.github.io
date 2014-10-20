---
layout: post
title: ISU CDC Fall 2013 Reflection
---

I participated in the Fall 2013 ISU Cyber Defense Competition. This event was an invaluable experience that greatly added to my professional career. This report outlines my experience as it goes through what I learned and what I could have done better for the competition. This report will help me to reflect on the competition and improve my techniques for next time.

##### CDC Participation and Your Major
As a computer engineering major, the CDC greatly benefited me. I developed on a technical level and a professional level. The CDC always offers a great challenge and allows me to solve real world problems. I think the CDC really is a unique experience. It let me gain skills that will increase my employability and open many career opportunities. The CDC taught me many security principles that, as a computer engineer, will be very useful in the increasingly internet-connected world that we live in.

##### Career Relationship
The CDC complements my career path very well. When designing computer systems and software systems in the modern world, it is imperative that the designs take into account the security of the system. Since I will be designing computer networks and software systems, my real world experience will greatly assist with these tasks.

##### Relationship to Courses/What You Learned on Your Own
I have learned many things in my internships and on my own that helped me succeed at the CDC. At my internships I have learned secure coding practices and system design practices that allowed me to create a secure and reliable network. I learned to securely write web applications at one of my internships. This helped me audit the code from the web server that we were given for the competition. I have learned several things from my previous CDCs that also helped me prepare for this CDC. This assisted in my ability to predict how the red team would attempt attacks on our network. I taught myself how to use Linux, which was very helpful in using our network.

##### CDC and Real World Experience
The CDC had as real as a scenario that you could possibly have. It demonstrated real world situations that a security professional would encounter. Networks aren’t always designed properly, attackers target your networks regularly, and anomalies are thrown at you at a moment’s notice. The time constraints are realistic because you could have to come in and secure a network in a very short amount of time, all while attacks are impending.

##### What you could do differently – Red Team
One of the vulnerabilities we encountered was that we had repeated failed logins possible on our web application. This allowed red team to attempt brute force attacks against our login forms. If I had more time to fix the application, I would have added a feature that prevented repeated login failures. We could have blocked the user after several failed logins. This would prevent them from automatically attempting passwords. This vulnerability would be a software design flaw.

##### What you could do differently – Green Team
One of the green team anomalies we encountered was to take certain users and give them administrative access rights. This posed an issue for our team: either give the users administrative rights or forfeit the points for the anomaly. We ended up not doing the anomaly because we assumed red team already compromised the users and the ramifications would have been detrimental. If an end user had made the request, more discussion would be typically be had to consider the request. Another anomaly we received was to add an FTP service to one of our servers. Users had to be able to FTP to our shell server and upload and download files to it. This was a fairly simple task so we decided to implement it. If a single end user requested this service, it would most likely be denied in the real world. Since it is not a secure protocol, it poses a security risk to the company.

The CDC was an overall fun and excellent learning experience. I always enjoy the atmosphere. I had a chance to talk to some of the sponsoring companies and they were very impressed by my technical and leadership abilities. I think my team performed very well. We worked very hard and the work paid off: we placed third, so we will be able to compete in the National ISU CDC in the spring.

I took a screenshot of a graph of our log data sent to Splunk over time after the competition was over:
![Using Splunk, I created a graph of kB’s of log data over time by host.](/assets/images/isu-cdc-fall-2013.png)

I have also attached one of my team’s intrusion reports that received full credit during the competition.
[ISU CDC 2013 – Team 14 Intrusion Report 4:00PM](/assets/files/isu-cdc-fall-2013-report.pdf)
