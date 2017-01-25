class ItemsController < ApplicationController
  def show
    Item.find
    params = {
        table_name: 'Monster'
    }

    Aws.config.update({
                          region: AWS_SETTINGS["aws_dynamo"]['region'],
                          credentials: Aws::Credentials.new(AWS_SETTINGS["aws_dynamo"]['access_key_id'], AWS_SETTINGS["aws_dynamo"]['secret_access_key'])
                      })
    @@dynamo_db = Aws::DynamoDB::Client.new
    @@dynamo_db.scan(params).items.each{|movie|
      item = "#{movie["id"].to_i}: " +
          "#{movie["title"]} ... " +
          "#{movie["info"]["rating"].to_f}"
    }

    respond_with item
  end
end
