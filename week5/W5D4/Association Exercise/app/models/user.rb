class User < ApplicationRecord
  
  has_many :enrollments,
    foreign_key: :student_id,
    class_name: :Enrollment
  #enrolled course - has_many - through association to check user class and 
  # go through course. 

  #enrolled_course#2 want to get the courses that the student is enrolled in
  #pick up course id from enrollments (then utilize that course and get
  #corresponding student id for that course)
  # has_many :enrolled_courses,
  #   foreign_key: :course_id,
  #   class_name: :Enrollment
  has_many :enrolled_courses,
    through: :enrollments,
    source: :course
  #start in user, get to courses, go THROUGH 

  has_many :instructed_courses,
    foreign_key: :instructor_id,
    class_name: :Course

  # validates :name, presence: true

end



