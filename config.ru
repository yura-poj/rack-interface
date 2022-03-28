require_relative 'app'
require_relative 'middleware/check_path'
require_relative 'middleware/check_params'

use CheckPath
use CheckParams
run App.new
