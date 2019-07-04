create database db_jobManagementSystem

create table college(
	collegeName char(25) not null,
	collegeID int primary key
)

create table class(
	className char(25) not null,
	classID int primary key
)

create table teacher(
	teacherName char(8) not null,
	teacherID int primary key,
	teacherPassword char(12) not null,
	collegeID int foreign key references college(collegeID) on delete cascade on update cascade
)

create table student(
	studentName char(8) not null,
	studentID int primary key,
	studentPassword char(12) not null,
	classID int foreign key references class(classID) on delete cascade on update cascade,
	collegeID int foreign key references college(collegeID) on delete cascade on update cascade
)

create table course(
	courseName char(25) not null,
	courseID int primary key
)

create table teach(
	teahcerID int foreign key references teacher(teacherID) on delete no action on update no action,
	studentID int foreign key references student(studentID) on delete no action on update no action,
	courseID int foreign key references course(courseID) on delete no action on update no action
)

create table homework(
	courseID int foreign key references course(courseID) on delete no action on update no action,
	homeworkID int primary key,
	homeworkSubmissionTime datetime not null,
	homeworkFullScore float not null,
	homeworkDescribe char(250)
)

create table assign(
	teacherID int foreign key references teacher(teacherID) on delete no action on update no action,
	studentID int foreign key references student(studentID) on delete no action on update no action,
	homeworkID int foreign key references homework(homeworkID) on delete no action on update no action,
	primary key(teacherID, studentID, homeworkID),
	assignScore float,
	assignExampleFlag int not null,
	assignSubmissionFlag int not null,
	assignCheckFlag int not null	
)

create table question(
	questionID int primary key,
	questionType int not null,
	courseID int foreign key references course(courseID) on delete no action on update no action,
	questionContent char(250) not null,
	questionDifficulty int not null,
	questionOptionA char(50),
	questionOptionB char(50),
	questionOptionC char(50),
	questionOptionD char(50),
	questionRightAnswer char(250)
)

create table assignmentContent(
	homeworkID int foreign key references homework(homeworkID) on delete cascade on update cascade,
	questionID int foreign key references question(questionID) on delete cascade on update cascade,
	primary key(homeworkID, questionID)
)

create table writeQuestion(
	studentID int foreign key references student(studentID) on delete cascade on update cascade,
	homeworkID int foreign key references homework(homeworkID) on delete cascade on update cascade,
	questionID int foreign key references question(questionID) on delete cascade on update cascade,
	studentAnswer char(250),
	questionScore float,
)

create view studentLogin as
select studentLoginID,studentPassword
from student

create view teacherLogin as
select teacherLoginID, teacherPassword
from teacher


create view studentAssignment as
select distinct assign.teacherID,teacherName,studentName,assign.studentID,course.courseID,courseName,homework.homeworkID,homeworkDescribe,assignSubmissionTime,assignDeadTime,assignScore,assignCheckFlag,assignSubmissionFlag,className
from homework, assign,teacher,student,course,class
where assign.teacherID = teacher.teacherID and assign.homeworkID = homework.homeworkID and homework.courseID = course.courseID and assign.studentID = student.studentID and student.classID = class.classID


create view view_student as
SELECT studentName, studentID, student.classID, student.collegeID, className, collegeName
FROM student, college, class
WHERE college.collegeID = student.collegeID AND class.classID = student.classID

create view view_teacher as
select teacherID, teacherName,teacher.collegeID, collegeName, activeFlag
from teacher, college
where teacher.collegeID=college.collegeID
