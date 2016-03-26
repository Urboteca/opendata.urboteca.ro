class Map < ActiveRecord::Base

  VALID_URL_REGEX = /\Ahttps?:\/\/(www\.)?[-a-zA-Z0-9@._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&\/\/=]*)/i

  SECTORS = ['Sector 1', 'Sector 2', 'Sector 3', 'Sector 4', 'Sector 5', 'Sector 6']
  CITIES = ['Bucharest']
  TYPES = ['ALIPIRE TERENURI', 'ALTELE', 'BALCON', 'DESFINTARE', 'DEZMEMBRARE', 'IMOBIL MIXT', 'IMOBIL REZIDENTIAL']
  COLUMNS_NAME_SQL = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='cu_2015'"
  COUNT_DATA = "SELECT count(*) FROM 'cu_2015'"
  DATA_PER_SECTOR = "SELECT * FROM cu_2015 where lower(sector)=lower('%s')"
  DATA_PER_CITY = "SELECT * FROM cu_2015 where lower(oras)=lower('%s')"
  COUNT_DATA_PER_SECTOR = "SELECT count(*) FROM cu_2015 where lower(sector)=lower('%s')"
  COUNT_DATA_PER_CITY = "SELECT count(*) FROM cu_2015 where lower(oras)=lower('%s')"

  validates :name, presence: true
  validates :description, presence: true
  validates :cartodb_url, presence: true, format: { with: VALID_URL_REGEX }
  validates :cartodb_sql_url, presence: true, format: { with: VALID_URL_REGEX }

  attr_accessor :metadata
end
