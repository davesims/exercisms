module Responder
  def hey(words)
    responses[StatementBuilder.build(words).class.to_s.downcase.to_sym]
  end
end

module Teenager
  include Responder

  def responses
    {
      :nothing => "Fine. Be that way.",
      :yelling => "Woah, chill out!",
      :question => "Sure.",
      :default =>  "Whatever."
    }
  end
end

module Adult
  include Responder

  def responses
    {
      :nothing => "That's OK.",
      :yelling => "I'm sorry, is something wrong?",
      :question => "How can I help you?",
      :default => "Can you repeat that please?"
    }
  end
end

class Jerry
  include Adult
end

class Bob
  include Teenager
end

module StatementBuilder
  def self.statement_types
    [Nothing, Yelling, Question, Default]
  end

  def self.build(words)
    statement_types.each { |type| return type.new if type.is_type?(words) }
  end
end

class Nothing
  def self.is_type?(words)
    words.to_s.empty?
  end
end

class Question
  def self.is_type?(words)
    words.end_with?("?")
  end
end

class Yelling
  def self.is_type?(words)
    words.eql?(words.upcase)
  end
end

class Default
  def self.is_type?(words)
    true 
  end
end


