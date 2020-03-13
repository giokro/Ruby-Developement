require 'grade.rb'
require 'student.rb'
# class
class Course
  attr_reader :name, :start_date

  def initialize(name, start_date)
    @name = name
    @start_date = Date.parse(start_date.to_s)
    @students_in_course = {}
  end

  def to_s
    "#{@name} starts on #{@start_date}."
  end

  def started?
    Time.now.utc.to_date >= @start_date
  end

  def enrol(student)
    raise "Can not enrol #{student}. #{@name} start is in past." if started?

    @students_in_course.store(student, nil)
  rescue StandardError => e
    warn e.message
  end

  def enrolled?(student)
    @students_in_course.key?(student)
  end

  def enrolled_students
    @students_in_course.keys
  end

  def grade_student(student, grade, date = Time.now.utc.to_date.to_s)
    # rubocop: disable Metrics/LineLength
    raise "Can not grade not enrolled student #{student}." unless enrolled?(student)

    # rubocop: enable Metrics/LineLength
    @students_in_course[student] = Grade.new(grade, date)
  rescue StandardError => e
    warn e.message
  end

  def student_grade(student)
    @students_in_course[student]
  end

  def grades
    temp = @students_in_course.select { |_k, v| v }
    keys = temp.keys

    a = {}
    i = 0
    while i < keys.length
      a[keys[i]] = @students_in_course[keys[i]].number
      i += 1
    end
    a
  end
end
