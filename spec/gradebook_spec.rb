require 'rspec'
require './lib/gradebook'
require './lib/course'
require './lib/student'

RSpec.describe Gradebook do
  it "exists" do
    gradebook = Gradebook.new("Tina")
    expect(gradebook).to be_instance_of(Gradebook)
  end

  it "has an instructor" do
    gradebook = Gradebook.new("Tina")
    expect(gradebook.instructor).to eq "Tina"
  end

  it "has no courses by default" do
    gradebook = Gradebook.new("Tina")
    expect(gradebook.courses).to eq([])
  end

  it "can add courses" do
    gradebook = Gradebook.new("Tina")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Composition", 3)
    gradebook.add_course(course1)
    gradebook.add_course(course2)
    expect(gradebook.courses).to eq([course1, course2])
  end

  xit "can list all students in hash" do
    gradebook = Gradebook.new("Tina")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Composition", 1)
    gradebook.add_course(course1)
    gradebook.add_course(course2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Cordon", age: 36})
    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    require "pry"; binding.pry
  end

  it "lists students below threshold" do
    gradebook = Gradebook.new("Tina")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Composition", 1)
    gradebook.add_course(course1)
    gradebook.add_course(course2)
    student1 = Student.new({name: "Morgan", age: 21})
    student1.log_score(89)
    student1.log_score(78)
    expect(student1.grade).to eq (83.5)
    student2 = Student.new({name: "Jordan", age: 29})
    student2.log_score(78)
    student2.log_score(78)
    expect(student2.grade).to eq (78.0)
    student3 = Student.new({name: "Cordon", age: 36})
    student3.log_score(60)
    student3.log_score(60)
    expect(student3.grade).to eq (60.0)
    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    #require "pry"; binding.pry
    expect(gradebook.students_below(80.0)).to eq([student1, student3])

  end
end