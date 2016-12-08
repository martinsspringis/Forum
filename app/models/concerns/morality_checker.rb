module MoralityChecker
  BADWORDS = %w(lohs kuce maita)  

  def check_morality
  	bad_content = false

    fin = File.open("badwords.txt", "r")
    words = fin.read.split #split visus failā esošos vārdus saliek masīvā
    
    words.each do |badword|
      puts badword
    	if check_word(badword, content)
    		self.content = content.gsub "#{badword}", "[censored]"
        bad_content = true unless bad_content
      end
    end
    fin.close

    if bad_content
      if user.present?
      	user.warnings += 1
      	user.save
      end
    end

  end

  def check_word(word, content)
    bad_only = /\A#{word}\z/i
    bad_center = /\W#{word}\W/i
    bad_first = /\A#{word}\W/i
    bad_last = /\W#{word}\z/i
    bad_center_underscore = /[_]#{word}[_]/i
    bad_first_underscore = /\A#{word}[_]/i
    bad_last_underscore = /[_]#{word}\z/i
    bad_center_num = /\d#{word}\d/i
    bad_first_num = /\A#{word}\d/i
    bad_last_num = /\d#{word}\z/i
    
    if (bad_only.match(content) || bad_center.match(content) || bad_first.match(content) || bad_last.match(content)\
      || bad_center_underscore.match(content) || bad_first_underscore.match(content) || bad_last_underscore.match(content)\
      || bad_center_num.match(content) || bad_first_num.match(content) || bad_last_num.match(content))
      true
    end
  end

end