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
      if user.present?
      	user.warnings += 1
      	user.save
      end
    end

  end

end