require 'open-uri'
require 'nokogiri'


#convert while loop to for loop
#tidy up with methods and add user interactivity and score tracker to see if you've improved

page = rand(24) + 1
questions = []
answers = []
combined = []
count = 0
points = 0
point_value = 1
i = 0

q_a = Nokogiri::HTML(open("http://readymadepubquiz.com/quiz-#{page}-round-7-general-knowledge/"))
q_a.xpath('//div[@class = "entry_content"]/p/strong').each do |question|
  if question != ""
  questions.push(question.text.chomp[3..-1])
  end
end

q_a.xpath('//div[@class = "entry_content"]/p/em').each do |answer|
  if answer != ""
  answers.push(answer.text.chomp)
  end
end

while count < questions.length
  combined[count] = {:"#{questions[count]}" =>  "#{answers[count]}"}
  count += 1
end

while combined[i] != nil
  puts combined[i].keys
  answer = gets.chomp.downcase
  if answer == "" || answer.length <= 1
    puts "You got it wrong"
    puts "The correct answer was #{combined[i].values[0]}"
  elsif combined[i].values[0].downcase.include?(answer)
    points += point_value
    puts "You got it right and you got a point"
  elsif answer == "print_q_a"
    puts combined
    break
  else
    puts "You got it wrong"
    puts "The correct answer was #{combined[i].values[0]}"
  end
  i += 1
end

if points == 1
  puts "You got #{points} point"
elsif points != 0
  puts "You got #{points} points"
else
  puts "You did not earn any points"
end

