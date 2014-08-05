# coding: utf-8

module DiscussionsUtils
	def student_discussions
		wallTypeDiscussion = Wall.find_all_by_publication_type_and_public_and_network_id('Discussion', true, current_network.id)
    discussionsPublic = wallTypeDiscussion.map { |e| e.publication }

    courses = student_subscribed_courses

    discussionsCourse = courses.inject([]) do
      |accu, course|
      accu + course.discussions
    end

    discussions = discussionsPublic + discussionsCourse

    discussions = discussions.sort do
      |x,y| y.created_at <=> x.created_at
    end
	end

  def course_discussions(course)
    discussions = course.discussions
    discussions = discussions.sort do
      |x,y| y.created_at <=> x.created_at
    end
  end
end