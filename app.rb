require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def display_all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def display_people
    @people.each do |person|
      if person.instance_of?(Student)
        puts "[Studnet], ID: #{person.id}, Name: #{person.name}, age: #{person.age}"
      else
        puts "[Teacher  ], ID: #{person.id}, Name: #{person.name}, age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to add a student (1) or a teacher (2)? [Input the number]:'
    student_or_teacher = gets.chomp.to_i
    case student_or_teacher
    when 1
      create_student
    when 2
      create_teacher
    else
      print 'print enter a valid number: 1 or 2'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    permission = gets.chomp.downcase == 'y'
    student = Student.new(age, permission, name)
    @people << student
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'speacialization: '
    speacialization = gets.chomp
    teacher = Teacher.new(age, speacialization, name)
    @people << teacher
    puts 'Teacher created successfully'
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def add_rental
    puts 'Select a book form the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index} Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    print 'Date: '
    rental_date = gets.chomp

    rental = Rental.new(rental_date, @books[book_index], @people[person_index])
    @rental << rental
    puts 'Rental created successfully'
  end

  def display_all_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rental: '
    @rental.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\", by #{rental.book.author}" if rental.person.id == id
    end
  end
end
