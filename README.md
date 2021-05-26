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

Table Name : ScriptsAndMarks

Schema:
> | **studentId(20) | BSId(12)** | desc1Script(40) | desc1Marks(int) | quiz1Script(40) | quiz1Marks(int) | asgn1Script(40) | asgn1Marks(int) | mid1Marks(int) | desc2Script(40) | desc2Marks(int) | quiz2Script(40) | quiz2Marks(int) | asgn2Script(40) | asgn2Marks(int) | mid2Marks(int) | midNetMarks(int) | semScript(40) | semMarks(40) | semNetMarks(40) |

