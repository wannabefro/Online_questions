require 'open-uri'
require 'nokogiri'

page = rand(24) + 1
questions = []
answers = []

q_a = Nokogiri::HTML(open("http://readymadepubquiz.com/quiz-#{page}-round-7-general-knowledge/"))
q_a.xpath('//div[@class = "entry_content"]/p/strong').each do |question|
  questions.push(question.text.chomp)
end

q_a.xpath('//div[@class = "entry_content"]/p/em').each do |answer|
  answers.push(answer.text.chomp)
end

puts questions
puts answers