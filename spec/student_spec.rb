require_relative '../app/models/student'
describe Student do
  it "Creates an object from a row" do
  row = {"id"=>1, "name"=>"Steven", "super_power"=>"Time Travel", 0=>1, 1=>"Steven", 2=>"Time Travel"}
  s = Student.new_from_row(row)

  expect(s.id).to eq 1
  expect(s.name).to eq "Steven"
  expect(s.super_power).to eq "Time Travel"
  end

  it "Returns all of the students from the db" do
    students = Student.all
    expect(students.first).to be_a Student
    expect(students.first.name).to eq("Steven")
  end

  it "finds a student by name" do
    student = Student.find_by_name("Adam")
    expect(student.name).to eq("Adam")
    expect(student.super_power).to eq("Super Powers")
  end

  it "returns nil if student not found" do
    student = Student.find_by_name("Bam Bam")
    expect(student).to be_nil
  end
end
