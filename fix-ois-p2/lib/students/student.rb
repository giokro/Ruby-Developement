require 'active_record'
# class
class Student < ActiveRecord::Base
  def to_s
    "#{name} (id: #{id})"
  end
end
