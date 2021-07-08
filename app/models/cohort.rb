class Cohort < ActiveRecord::Base
  has_many :students

  def add_student(name, age)
    Student.create(name: name, age: age, cohort_id: self.id)
  end

  def average_age
    self.students.map{|stud| stud.age}.sum/self.total_students.to_f

  end

  def total_students
    self.students.length
  end

  def self.biggest
    self.all.max_by{|coh| coh.total_students}
  end

  def self.sort_by_mod
    self.all.sort_by{|coh| coh.current_mod}
  end

end