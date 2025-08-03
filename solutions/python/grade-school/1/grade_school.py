class School:
    def __init__(self):
        self.student_roster = []
        self.student_added = []

    def add_student(self, name, grade):
        if not any(ele[1] == name for ele in self.student_roster):
            self.student_roster.append((grade, name))
            self.student_added.append(True)
        else:
            self.student_added.append(False)

    def roster(self):
        roster_list=[x[1] for x in sorted(self.student_roster)]
        return roster_list

    def grade(self, grade_number):
        grade_list = [x[1] for x in self.student_roster if x[0] == grade_number]
        grade_list.sort()
        return grade_list

    def added(self):
        return self.student_added
