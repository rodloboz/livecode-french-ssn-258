require 'date'
require 'yaml'
require 'byebug'

PATTERN = /^(?<gender>[12])\s?(?<year>\d{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<department>\d[1-9]|[1-9]0|2[AB])(\s?\d{3}){2}\s?(?<key>\d{2})/
DEPARTMENTS = YAML.load_file('./data/french_departments.yml')
# Extract named groups from the ssn
# Determine gender
# Determine year '19 + year'
# Determine the month
# Read departments (hash) from file
# Get department name
# Build sentence and return

def french_ssn_info(ssn)
  return "The number is invalid" if ssn.empty?

  match_data = ssn.match(PATTERN)

  gender = gender(match_data[:gender])
  month = month(match_data[:month])
  year = year(match_data[:year])
  department = department(match_data[:department])

  if valid_key?(ssn, match_data[:key])
    "a #{gender}, born in #{month}, #{year} in #{department}."
  else
    "The number is invalid"
  end
end

def gender(code)
  code == '1' ? 'man' : 'woman'
end

def year(code)
  "19#{code}"
end

def month(code)
  Date::MONTHNAMES[code.to_i]
end

def department(code)
  DEPARTMENTS[code]
end

def valid_key?(ssn, key)
  ssn_without_key = cleanup_number_string_and_convert_to_i(ssn)
  (97 - ssn_without_key) % 97 == key.to_i
end

def cleanup_number_string_and_convert_to_i(ssn)
  ssn.delete(" ")[0..-3].to_i
end

# french_ssn_info('1 84 12 76 451 089 46')
