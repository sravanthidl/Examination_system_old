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