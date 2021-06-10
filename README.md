# Examination_system

Table Name : Controller

Schema :
> | **controllerId(20)** | password(20) | name(40) | designation(30) | mobile(10) | email(40) |

Table Name : Teacher

Schema :
> | **teacherId(20)** | password(20) | name(40) | branch(3) | designation(30) | mobile(10) | email(40) |

Table Name : Subject

Schema :
> | year(int) | branch(5) | subjectName(8) | **YBSId(12)** | BSId(12) | teacherId(20) |

Table Name : Descriptive

Schema :
> | **YBSId(15) | examType(5)** | teacherId(20) | QPaperPath(20) | examDate(12) | examOpenTime(12) | examCloseTime(12) | asgnPaperPath(20) | asgnOpenDate(12) | asgnCloseDate(12) |

Table Name : Quiz

Schema :
> | **YBSId(15) | examType(5) | quetionNo(int)** | question(400) | optionA(200) | optionB(200)(200) | optionC(200) | optionD(200) | answerOption(200) |

Table Name : ExamTask

Schema :
> | **year(int) | examType(5)** | settingOpenDate(12) | settingCloseDate(12) | evaluationOpenDate(12) | evaluationCloseDate(12) | resultOpenDate(12) |

Table Name : SAM

Schema:
> | **studentId(20) | YBSId(12)** | desc1Script(40) | desc1Marks(int) | quiz1Script(40) | quiz1Marks(int) | asgn1Script(40) | asgn1Marks(int) | mid1NetMarks(int) | desc2Script(40) | desc2Marks(int) | quiz2Script(40) | quiz2Marks(int) | asgn2Script(40) | asgn2Marks(int) | mid2NetMarks(int) | midNetMarks(int) | semScript(40) | semMarks(40) | semNetMarks(40) |


To - Do:
1. Change title names on tabs(Done)
2. Add paths on top bar(Done)
3. YBS Id change(Done)
4. Add sem at each scheduling, mayb both controller and teacher(Done)
4. Add Lab marks entering(Done)
5. Start new sem(Done)
6. View statuses(Done)
7. Quiz front end(Done)
8. Front end proper(Done)
9.Notifications(Done)
10.Results(Done)
11.Marks min/max choice-(Done)
12. Login, Register front end(Done)
13.Code refactoring________________________________________________(7)
14.External Teacher(Done)
15. Controller statuses(Done)
16.PassKeys(Done)
17.Question paper display for correction(Done)
18.Home button(Done)
