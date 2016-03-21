class Map < ActiveRecord::Base

  VALID_URL_REGEX = /\Ahttps?:\/\/(www\.)?[-a-zA-Z0-9@._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&\/\/=]*)/i

  COLUMNS_NAME_SQL = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='cu_2015'"
  COUNT_DATA = "SELECT count(*) FROM 'cu_2015'"
  DATA_PER_SECTOR = "SELECT * FROM cu_2015 where sector='%s'"
  DATA_PER_CITY = "SELECT * FROM cu_2015 where oras='%s'"
  COUNT_DATA_PER_SECTOR = "SELECT count(*) FROM cu_2015 where sector='%s'"
  COUNT_DATA_PER_CITY = "SELECT count(*) FROM cu_2015 where oras='%s'"

  validates :name, presence: true
  validates :description, presence: true
  validates :cartodb_url, presence: true, format: { with: VALID_URL_REGEX }
  validates :cartodb_sql_url, presence: true, format: { with: VALID_URL_REGEX }
end
