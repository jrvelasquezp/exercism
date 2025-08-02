"""Functions for organizing and calculating student exam scores."""


def round_scores(student_scores):
    """Round all provided student scores.

    :param student_scores: list - float or int of student exam scores.
    :return: list - student scores *rounded* to nearest integer value.
    """

    round_scores = [ round(x) for x in student_scores ]
    return round_scores


def count_failed_students(student_scores):
    """Count the number of failing students out of the group provided.

    :param student_scores: list - containing int student scores.
    :return: int - count of student scores at or below 40.
    """
    count=0
    for i in student_scores:
        if i<=40:
            count=count+1


    return count


def above_threshold(student_scores, threshold):
    """Determine how many of the provided student scores were 'the best' based on the provided threshold.

    :param student_scores: list - of integer scores.
    :param threshold: int - threshold to cross to be the "best" score.
    :return: list - of integer scores that are at or above the "best" threshold.
    """
    best_students = []
    for i in student_scores:
        if i>=threshold:
            best_students.append(i)


    return best_students


def letter_grades(highest):
    """Create a list of grade thresholds based on the provided highest grade.

    :param highest: int - value of highest exam score.
    :return: list - of lower threshold scores for each D-A letter grade interval.
            For example, where the highest score is 100, and failing is <= 40,
            The result would be [41, 56, 71, 86]:

            41 <= "D" <= 55
            56 <= "C" <= 70
            71 <= "B" <= 85
            86 <= "A" <= 100
    """
    scores=[]
    lowest=40
    interval=int((highest-lowest)/4)
    grade=lowest+1
    for i in range(4):
        scores.append(grade)
        grade=grade+interval

    return scores


def student_ranking(student_scores, student_names):
    """Organize the student's rank, name, and grade information in ascending order.

    :param student_scores: list - of scores in descending order.
    :param student_names: list - of string names by exam score in descending order.
    :return: list - of strings in format ["<rank>. <student name>: <score>"].
    """
    student_ranking=[]
    for i in student_scores:
        student_ranking.append(str(student_scores.index(i)+1) + '. ' +student_names[student_scores.index(i)]+': '+str(i))

    return student_ranking


def perfect_score(student_info):
    """Create a list that contains the name and grade of the first student to make a perfect score on the exam.

    :param student_info: list - of [<student name>, <score>] lists.
    :return: list - first `[<student name>, 100]` or `[]` if no student score of 100 is found.
    """
    perfect=[]
    for i in student_info:
        if i[1]==100:
            perfect.append(i[0])
            perfect.append(i[1])
            break


    return perfect
    pass
