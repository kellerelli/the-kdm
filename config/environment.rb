# Load the Rails application.
require_relative 'application'

AWS_SETTINGS = YAML.load_file("#{Rails.root}/config/aws_dynamo.yml")
#Aws.init
# Initialize the Rails application.
Rails.application.initialize!

$aws_object = Aws.init