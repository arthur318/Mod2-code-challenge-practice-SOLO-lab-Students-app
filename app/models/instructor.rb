class Instructor < ApplicationRecord
    has_many :students

    def avg_age
        self.students.sum(&:age)/self.students.length
    end

    def student_sorted
        # self.students.sort_by(&:name)
        self.students.sort_by { |student| student.name }
    end
end
