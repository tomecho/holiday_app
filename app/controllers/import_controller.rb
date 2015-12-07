class ImportController < ApplicationController
  def create #handle posted json
    request = ActiveSupport::JSON.decode(request.body)
  end
end
