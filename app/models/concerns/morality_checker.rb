module MoralityChecker
  BADWORDS = %w(lohs kuce maita)  

  def check_morality
  	bad_content = false
    BADWORDS.each do |badword|
    	if content.include? badword
    		self.content = content.gsub "#{badword}", "[censored]"
        bad_content = true unless bad_content
      end
    end

    if bad_content
    	user.warnings += 1
    	if(user.warnings >= 10)
        user.blocked = true
    	end
    	user.save
    end

  end

end