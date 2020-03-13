require 'date'
require 'active_record'

# class
class Grade < ActiveRecord::Base
  def to_s
    "#{number} on #{date}"
  end
end
