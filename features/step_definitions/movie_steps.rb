# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(title: movie[:title], rating: movie[:rating], release_date: movie[:release_date], director: movie[:director])
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  assert_match(/#{e1}.*#{e2}/m, page.body)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: "(.*)"$/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(', ')
  ratings.each do |rating|
    if uncheck
      uncheck(%{ratings_#{rating}})
    else
      check(%{ratings_#{rating}})
    end
  end
end

Then /I should see only movies with the ratings: "(.*)"$/ do |rating_list|
  ratings = rating_list.split(', ')
  checkboxes = %w(G PG PG-13 R)
  checkboxes.each do |checkbox|
    regexp = /^#{checkbox}$/
    if ratings.include? checkbox
      if page.respond_to? :should
        page.should have_xpath('//td', :text => regexp)
      else
        assert page.has_xpath?('//td', :text => regexp)
      end
    else
      if page.respond_to? :should
        page.should have_no_xpath('//td', :text => regexp)
      else
        assert page.has_no_xpath?('//td', :text => regexp)
      end
    end
  end
end

Then /^the director of "(.+)" should be "(.+)"$/ do |movie, director|
  step "I should see \"#{movie}\""
  step "I should see \"#{director}\""
end