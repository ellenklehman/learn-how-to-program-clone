class Lesson < ActiveRecord::Base
  validates :name, :presence => true

  def next
    ordered_lessons = Lesson.all.order(:number)
    ordered_lessons[ordered_lessons.find_index(self) + 1]
  end

  def previous
    ordered_lessons = Lesson.all.order(:number)
    ordered_lessons[ordered_lessons.find_index(self) -1]
  end
end
