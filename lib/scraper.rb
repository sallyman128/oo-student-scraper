require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = doc.css(".student-card a")

    students.map do |student|
      student = {
        :name => student.css("div.card-text-container .student-name").text,
        :location => student.css("div.card-text-container .student-location").text,
        :profile_url => student.attribute("href").value
      }
    end
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))

    student_info = {
      :profile_quote => doc.css("div.profile-quote").text,
      :bio => doc.css("p").text
    }

    doc.css("div.social-icon-container a").each do |link|
      site = link.attribute("href").value
      key = :blog
      key = :twitter if site.include?("twitter")
      key = :linkedin if site.include?("linkedin")
      key = :github if site.include?("github")

      student_info[key] = link.attribute("href").value
    end

    student_info
  end

end

