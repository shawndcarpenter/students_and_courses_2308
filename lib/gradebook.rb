class Gradebook
  attr_reader :instructor, :courses, :students

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    @courses.map do |course|
      course.students

    end

  end

  def students_below(threshold)
    students_below = []
    @courses.students.each do |student|
      if student.grade < threshold
        students_below << student
      end
      students_below
    end


  end

end