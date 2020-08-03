# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  enum admin: {active: 1, archived: 0}
end
