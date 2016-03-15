class Map < ActiveRecord::Base

  VALID_URL_REGEX = /\Ahttps?:\/\/(www\.)?[-a-zA-Z0-9@._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&\/\/=]*)/i

  validates :name, presence: true
  validates :cartodb_url, presence: true, format: { with: VALID_URL_REGEX }

end
