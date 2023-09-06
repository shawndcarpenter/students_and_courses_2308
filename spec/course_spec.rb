require 'rspec'
require './lib/course'
require './lib/student'

RSpec.describe Course do
  it "exists" do
    course = Course.new("Calculus", 2) 
    expect(course).to be_instance_of(Course)
  end

  it "has attributes" do
    course = Course.new("Calculus", 2) 
    expect(course.name).to eq("Calculus")
    expect(course.capacity).to eq(2)
  end

  it "starts with no students" do
    course = Course.new("Calculus", 2) 
    expect(course.students).to eq([])
  end

  it "is not full by default" do
    course = Course.new("Calculus", 2)
    expect(course.full?).to be(false)
  end

  it "enrolls students in course" do
    course = Course.new("Calculus", 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    course.enroll(student1)
    course.enroll(student2)
    expect(course.students).to eq([student1, student2])
    expect(course.full?).to be_truthy
  end
end
