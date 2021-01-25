class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    @name = student_hash[:name]
    @location = student_hash[:location]
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do |student|
      self.new(student)
    end
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |key, value|
      @twitter = value if key.to_s == "twitter"
      @linkedin = value if key.to_s == "linkedin"
      @github = value if key.to_s == "github"
      @blog = value if key.to_s == "blog"
      @profile_quote = value if key.to_s == "profile_quote"
      @bio = value if key.to_s == "bio"
    end
  end

  def self.all
    @@all
  end
end

