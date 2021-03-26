class Course < ApplicationRecord
    belongs_to :prereq,
    foreign_key: :prereq_id,
    class_name: :Course, #pretty common #doulble expain
    optional: true

    has_many :enrollments,
    foreign_key: :course_id,
    class_name: :Enrollment

    has_many :enrolled_students,
      through: :enrollments,
      source: :user

    belongs_to :instructor,
      # through: :instructors,
      # source: :user
      foreign_key: :instructor_id,
      class_name: :User


    # validates :prereq_id, :instructor_id, :name, presence: true

end
