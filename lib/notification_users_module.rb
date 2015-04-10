module NotificationUsersModule
  def notification_users
    users = []
    self.courses.each do |course|
      course.members_in_courses.each do |member|
        user = member.user
        users.push(user) if user.id != self.user_id && member.accepted?
      end
    end
    return users
  end
end