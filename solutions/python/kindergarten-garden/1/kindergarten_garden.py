default_children=['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Fred', 'Ginny', 'Harriet', 'Ileana', 'Joseph', 'Kincaid', 'Larry']
plants_dict={
                'R':'Radishes',
                'C':'Clover',
                'G':'Grass',
                'V':'Violets'
            }

class Garden:
    def __init__(self, diagram, students=default_children):
        self.diagram=diagram
        students.sort()
        self.students=students

    def plants(self,student):
        plants_per_row=self.diagram.split('\n')
        plants_per_child=[]
        child=0
        plant_number=1
        plants_per_child=[[] for x in range(len(self.students))]
        for plant in plants_per_row[0]:
            plants_per_child[child].append(plants_dict[plant])
            plant_number=plant_number+1
            child=child + plant_number % 2
        child=0
        plant_number=1
        for plant in plants_per_row[1]:
            plants_per_child[child].append(plants_dict[plant])
            plant_number=plant_number+1
            child=child + plant_number % 2
        return plants_per_child[self.students.index(student)]

