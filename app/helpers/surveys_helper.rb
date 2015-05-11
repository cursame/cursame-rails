module SurveysHelper
	def survey_notice(timer)
		if timer.to_i == 0
			false
		else
			t('.notice_helper') + " #{timer} " +  t('.notice_helper2')
		end
	end
end
