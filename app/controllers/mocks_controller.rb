# TODO: delete this controller
class MocksController < ApplicationController
  skip_before_filter :authenticate_user!
end
