class ItemsController < ApplicationController
  def show
    params = {
        table_name: 'Monster'
    }

    Aws.config.update({
                          region: AWS_SETTINGS["aws_dynamo"]['region'],
                          credentials: Aws::Credentials.new(AWS_SETTINGS["aws_dynamo"]['access_key_id'], AWS_SETTINGS["aws_dynamo"]['secret_access_key'])
                      })
    @@dynamo_db = Aws::DynamoDB::Client.new

    respond_with @@dynamo_db.scan(params)
  end
end
